本项目算法基于深度学习卷积神经网络，完成歌唱声音频文件的旋律提取和后续的结果检测。

项目中的深度学习卷积神经网络架构基于算法[DeepConvSep](https://github.com/MTG/DeepConvSep)。


#### 1.基本配置及依赖库

主机环境：Ubuntu18.04+Python3.6

显卡驱动：NVIDIA CUDA 10.1

依赖库安装：

    pip install numpy scipy pickle cPickle climate theano
    pip install https://github.com/Lasagne/Lasagne/archive/master.zip


#### 2.iKala数据集

项目中的训练集和测试集均从iKala数据库中获得。

[数据库介绍及获取地址](http://mac.citi.sinica.edu.tw/ikala/)


#### 3.模型训练

训练集使用iKala数据集中人声、伴奏声以左右声道分开的部分。

    python -m examples.ikala.compute_features --db '/path/to/iKala/'
    THEANO_FLAGS=mode=FAST_RUN,device=cuda,floatX=float32,lib.cnmem=0.95 python -m examples.ikala.trainCNN --db '/path/to/iKala/'


#### 4.模型测试

测试集使用iKala数据集中人声、伴奏声混合的部分。

    python separate_ikala.py -i <inputfile> -o <outputdir> -m <path_to_model.pkl>


#### 5.音高跟踪

音高跟踪采用pYIN算法，可在Sonic Visualizer中运行。


#### 6.结果分析

本项目的结果分析基于MIREX旋律提取及音高跟踪比赛的评判标准，通过RPA-OA-test.m文件计算实验结果的RPA及OA。

[部分可视化结果展示](https://m.iqiyi.com/v_19rxoxg7b8.html)


