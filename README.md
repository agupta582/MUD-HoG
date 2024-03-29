## Long-Short History of Gradients is All You Need: Detecting Malicious and Unreliable Clients in Federated Learning

###### **Abstract**:

Federated learning offers a framework to train a machine learning model in a distributed fashion yet preserving privacy of the participants. As the server cannot govern the clients’ actions, nefarious clients may attack the global model by sending malicious local gradients. In a more challenging scenario, however, benign clients may have unreliable data and thus appear to be similar to malicious clients, making it much harder for a defense mechanism to perform this *three-fold* (as opposed to a two-fold) differentiation. This paper introduces MUD-HoG, a novel defense algorithm that uses *long-short history of gradients* to detect malicious and unreliable clients separately and treat them differently in federated learning. Equally importantly, we take into account both targeted and untargeted attacks unlike most prior studies which consider only one type of attacks. Specifically, we consider sign-flipping, additive-noise, label-flipping, multi-label-flipping, under non-IID settings as being  more realistic (yet more challenging as well).
The experimental results as compared to six state-of-the-art benchmarks show that MUD-HoG can successfully detect malicious and unreliable clients in a wide range of their population ratio (up to 47.5% and 10%, respectively), unlike many other works that handle a low ratio of harmful users. In the meantime, MUD-HoG also produces a better model with higher accuracy. Both of the above are achieved simultaneously in the presence of a mixture of multiple (four) types of attackers as well as unreliable clients.

![Overview of MUD-HoG](https://user-images.githubusercontent.com/67119520/201972724-684fd362-6bc1-4fea-8bda-1ea786165094.png)

###### **Citation Request**:

```
@inproceedings{gupta2022long,
  title={Long-Short History of Gradients Is All You Need: Detecting Malicious and Unreliable Clients in Federated Learning},
  author={Gupta, Ashish and Luo, Tie and Ngo, Mao V and Das, Sajal K},
  booktitle={European Symposium on Research in Computer Security},
  pages={445--465},
  year={2022},
  organization={Springer}
}
```
