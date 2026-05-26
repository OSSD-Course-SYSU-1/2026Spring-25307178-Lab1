# 跨设备无线文件传输

这是一个独立于 FinVideo 的局域网文件传输小工具。它用 Node.js 启动一个本地 HTTP 服务，同一 Wi-Fi 下的手机、平板、虚拟机或电脑访问局域网地址后，可以直接上传、下载和删除文件。

## 功能说明

- 支持同一局域网内跨设备无线传输文件。
- 支持多文件选择和拖拽上传。
- 上传时显示实时进度。
- 接收端可查看文件列表、下载文件、复制下载链接。
- 服务端每次启动生成 6 位 PIN，上传、下载和删除接口都需要 PIN。
- 不依赖 FinVideo，也不需要安装额外 npm 包。

## 文件结构

```text
wireless-file-transfer/
├── package.json
├── server.mjs
├── public/
│   ├── index.html
│   ├── styles.css
│   └── app.js
└── uploads/
    └── .gitkeep
```

## 运行方式

```powershell
cd wireless-file-transfer
npm run dev
```

启动后终端会显示：

```text
PIN: 123456
Local: http://127.0.0.1:5731
LAN:   http://你的局域网IP:5731
```

同一 Wi-Fi 下的另一台设备打开 `LAN` 地址即可进入传输页面。

## 演示步骤

1. 在电脑上运行 `npm run dev`。
2. 发送端打开页面，选择文件或把文件拖到上传区域。
3. 接收端用同一 Wi-Fi 访问终端显示的局域网地址。
4. 接收端在文件列表中点击“下载”获取文件。
5. 需要清理演示文件时，点击对应文件的“删除”按钮。

如果要现场真机演示，推荐直接运行：

```powershell
.\Start-Demo.ps1
```

完整演示流程见 `DEMO.md`。

## 注意事项

- 如果其他设备打不开局域网地址，优先检查是否连接同一个 Wi-Fi，以及 Windows 防火墙是否拦截 Node.js 入站连接。
- 默认端口是 `5731`，可以用 `node server.mjs --host 0.0.0.0 --port 其它端口` 修改。
- 默认单文件上限约为 2 GB，可以通过环境变量 `TRANSFER_MAX_BYTES` 调整。
- `uploads/` 下的真实上传文件不会提交到 GitHub。
