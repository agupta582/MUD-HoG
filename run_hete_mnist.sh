#!/bin/bash
declare -a AR_METHOD=("mudhog" "fedavg" "median" "gm" "krum" "mkrum" "foolsgold")

#### LIST CLIENTS for MNIST dataset
# Unrelibale:
LIST_UNRELIABLE=("38" "38,19" "38,19,20" "38,19,20,29" "38,19,20,29" "38,19,20,29")

# Untargeted: Sign-flipping attackers 
LIST_SF_ATTACKERS=("5" "5,6" "5,6,7" "5,6,7,8" "5,6,7,8,9" "5,6,7,8,9")

# Untargeted: Additive noise attackers
LIST_AN_ATTACKERS=("18" "18,14" "18,14,15" "18,14,15,16" "18,14,15,16,10" "18,14,15,16,10,12")

# Targeted: Label-flipping attackers:
LIST_LF_ATTACKERS=("3,1,17" "3,1,17,24" "3,1,17,24,11" "3,1,17,24,11,31" "3,1,17,24,11,31,30" "3,1,17,24,11,31,30,13")

# Targeted: Multi-labeli-flipping attackers:
LIST_MLF_ATTACKERS=("3,1,17" "3,1,17,24" "3,1,17,24,11" "3,1,17,24,11,31" "3,1,17,24,11,31,30" "3,1,17,24,11,31,30,13")

DATASET="mnist"
GLOBAL_EPOCHS=40
LOCAL_EPOCHS=4

# Series Exp1A (AN_LF): x1 unreliable clients, and j additive-noise (AN) attackers,
# and (j+3) label-flipping (LF) attackers; where j in range [2,6].
#EXP_NAME="sExp1A" # using normalized LongHoGs for TARGETED ATTACK and as a union of suspicious set1 (from shortHoGs during untargeted attack) and suspicious set2 (from normalized longHoGs)
#EXP_NAME="sExp1B"
#for ((i=0; i < 7; i++));
#do
#for ((j=0; j<6; j++));
#do
#CUDA_VISIBLE_DEVICES=0 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_${DATASET}_${AR_METHOD[$i]}_40C_$((j+3))LF --epochs $GLOBAL_EPOCHS --num_clients 40 --inner_epochs $LOCAL_EPOCHS --list_unreliable ${LIST_UNRELIABLE[$j]} --list_uatk_add_noise ${LIST_AN_ATTACKERS[$j]} --list_tatk_label_flipping ${LIST_LF_ATTACKERS[$j]} --verbose 
#done
#done

# sExp2A (AN_MLF): x1 unreliable clients, and j additive-noise (AN) attackers,
# and (j+3) multi-label-flipping (MLF) attackers; where j in range [2,6].
#EXP_NAME="sExp2B"
#for ((i=0; i < 7; i++));
#do
#for ((j=0; j<6; j++));
#do
#CUDA_VISIBLE_DEVICES=0 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_${DATASET}_${AR_METHOD[$i]}_40C_$((j+3))MLF --epochs $GLOBAL_EPOCHS --num_clients 40 --inner_epochs $LOCAL_EPOCHS --list_unreliable ${LIST_UNRELIABLE[$j]} --list_uatk_add_noise ${LIST_AN_ATTACKERS[$j]} --list_tatk_multi_label_flipping ${LIST_MLF_ATTACKERS[$j]} --source_labels 1,2,3
#done
#done


# Series Exp3A (SF_AN_MLF): x1 unreliable clients, and j additive-noise (AN) attackers,
# and (j+3) label-flipping (MLF) attackers; where j in range [2,6].
#EXP_NAME="sExp3B"
#for ((i=0; i < 7; i++));
#do
#for ((j=0; j<6; j++));
#do
#CUDA_VISIBLE_DEVICES=7 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_${DATASET}_${AR_METHOD[$i]}_40C_$((j+3))LF --epochs $GLOBAL_EPOCHS --num_clients 40 --inner_epochs $LOCAL_EPOCHS --list_unreliable ${LIST_UNRELIABLE[$j]} --list_uatk_flip_sign ${LIST_SF_ATTACKERS[$j]} --list_uatk_add_noise ${LIST_AN_ATTACKERS[$j]} --list_tatk_label_flipping ${LIST_LF_ATTACKERS[$j]} 
#done
#done

# Series Exp4A (SF_AN_MLF): x1 unreliable clients, and j additive-noise (AN) attackers,
# and (j+2) multi-label-flipping (MLF) attackers; where j in range [1,5].
EXP_NAME="sExp4B"
for ((i=0; i < 7; i++));
do
for ((j=0; j<6; j++));
do
CUDA_VISIBLE_DEVICES=7 python main.py --dataset $DATASET --AR ${AR_METHOD[$i]} --loader_type dirichlet --experiment_name ${EXP_NAME}_${DATASET}_${AR_METHOD[$i]}_40C_$((j+3))MLF --epochs $GLOBAL_EPOCHS --num_clients 40 --inner_epochs $LOCAL_EPOCHS --list_unreliable ${LIST_UNRELIABLE[$j]}  --list_uatk_flip_sign ${LIST_SF_ATTACKERS[$j]} --list_uatk_add_noise ${LIST_AN_ATTACKERS[$j]} --list_tatk_multi_label_flipping ${LIST_MLF_ATTACKERS[$j]}  --source_labels 1,2,3 --verbose 
done
done
