# EBSClient
建行外联平台服务

## 说明
建行退款类的业务跟微信支付宝不同，不能直接调接口进行处理，建行的退款方式有两种：
1. 登录商户服务平台（https://merchant.ccb.com/MCMain.htm） 手工操作退款。
2. 使用外联平台退款接口，参见《外联平台商户开发接口》。

手工操作肯定不行啦，下面介绍下外联平台

## 搭建方式
1. 使用Windows系统搭建，笔者没尝试过
2. 使用官方提供jar包，仅Java适用，笔者没尝试过
3. 使用笔者提供的SDK处理，适用任何语言，下面介绍下操作流程

## 启动外联平台服务
- 安装好Java环境
- 运行"java -jar ccb-cloud-sdk-1.0-SNAPSHOT.jar"来启动Java服务，绑定主机的8080端口
- 建议使用jdk1.8，高版本可能会缺少部分组件库，会报错

## 调用外联平台服务进行退款操作
- 接口地址：http://127.0.0.1:8080/ccb/pay/refund
- 请求参数：
```
{
    "merchantId": "商户号",
    "custId": "操作员账号", // 登录建行商户平台-服务管理-操作员管理,列表里面的客户号
    "transPwd": "操作员交易密码", // 创建操作员时候填的
    "certPassword": "证书密码", // 导出证书的时候填的密码
    "txCode": "5W1004", // 参考"外联平台商户开发接口_V4.0.chm",退款是这个"5W1004"
    "language": "CN",
    "url": "https://merchant.ccb.com",
    "certFilePath": "/config/MC123456789.pfx", // 使用绝对路径
    "configFilePath": "/config/config.xml", // 使用绝对路径
    "refundNo": "序列号", // 16位以内纯数字
    "refundAmt": "退款金额", // 单位：元
    "payRecordNo": "交易单号" // 交易的时候你传给建行的单号
}
```
- 返回参数：
```
{
    "return_CODE": "000000", // 参考"外联平台商户开发接口_V4.0.chm"
    "return_MSG": "退款成功", // 参考"外联平台商户开发接口_V4.0.chm"
    "order_NUM": "交易单号", // 交易的时候你传给建行的单号
    "tx_INFO": "" // 建行接口返回原文
}
```

## 备注
1. 操作员账号创建参考"商户外联平台设置流程_20170922.pdf"
2. 证书导出参考"商户外联平台设置流程_20170922.pdf"
3. 可以将SDK打包成镜像，用docker跑起来，美滋滋

网速慢的朋友可以在这里自行下载
链接：https://pan.baidu.com/s/1SqOSrVIfds_XGDEV0r2AnA 
提取码：4a7u 
复制这段内容后打开百度网盘手机App，操作更方便哦
