#!/bin/bash
declare -a AR_METHOD=("fedavg" "median" "gm" "krum" "mkrum" "foolsgold" "mudhog")
LIST_ATTACKERS=("4" "4,5" "4,5,6" "4,5,6,7" "4,5,6,7,8" "4,5,6,7,8,9" "4,5,6,7,8,9,10" "4,5,6,7,8,9,10,11" "4,5,6,7,8,9,10,11,12" "4,5,6,7,8,9,10,11,12,13" "4,5,6,7,8,9,10,11,12,13,14" "4,5,6,7,8,9,10,11,12,13,14,15" "4,5,6,7,8,9,10,11,12,13,14,15,16" "4,5,6,7,8,9,10,11,12,13,14,15,16,17" "4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" "4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" "4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" "4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21")

# 1. Homogeneous untargeted attack:
# 1.1  sign-flipping untargeted attack: 
#   we increase number of untargeted attackers from 1 to 18 clients, the remaining clients are normal clients. 

EXP_NAME="HomoSF"
DATASET="mnist"

for ((i=0; i < 7; i++));
do
for ((j=0; j<18; j++));
do
CUDA_VISIBLE_DEVICES=2 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_40C_4uRel_$((j+1))SFuAtk --epochs 30 --num_clients 40 --inner_epochs 4 --list_unreliable 0,1,2,3 --list_uattack_flip_sign ${LIST_ATTACKERS[$j]}
done
done

# 1.2  additive-noise untargeted attack: 
#   we increase number of untargeted attackers from 1 to 18 clients, the remaining clients are normal clients. 

EXP_NAME="HomoAN"
DATASET="mnist"

for ((i=0; i < 7; i++));
do
for ((j=0; j<18; j++));
do
CUDA_VISIBLE_DEVICES=3 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_40C_4uRel_$((j+1))ANuAtk --epochs 30 --num_clients 40 --inner_epochs 4 --list_unreliable 0,1,2,3 --list_uatk_add_noise ${LIST_ATTACKERS[$j]}
done
done

# 2. Homogeneous targeted attack:
# 2.1  Label-flipping targeted attack: 
# attacker flips label of digit "1" to "7" in its local dataset before training the local mode. We also increase the number of targeted attacker from 1 to 18 clients, the remaining clients are normal client.

EXP_NAME="HomoLF"
DATASET="mnist"

for ((i=0; i < 7; i++));
do
for ((j=0; j<18; j++));
do
CUDA_VISIBLE_DEVICES=2 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_40C_4uRel_$((j+1))LFtAtk --epochs 30 --num_clients 40 --inner_epochs 4 --list_unreliable 0,1,2,3  --list_tattack_1_to_7 ${LIST_ATTACKERS[$j]}
done
done

# 2.2  Multi-label-flipping targeted attack: 
#   we increase number of targeted attackers from 1 to 18 clients, the remaining clients are normal clients. 

EXP_NAME="HomoMLF"
DATASET="mnist"

for ((i=0; i < 7; i++));
do
for ((j=0; j<18; j++));
do
CUDA_VISIBLE_DEVICES=3 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_40C_4uRel_$((j+1))MLFtAtk --epochs 30 --num_clients 40 --inner_epochs 4 --list_unreliable 0,1,2,3 --list_tattack_all_to_7 ${LIST_ATTACKERS[$j]}
done
done
