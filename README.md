# 婚礼筹备网页 · 项目说明

小叶 & 小倪 婚礼筹备总览（单页网站）。所有样式、交互、数据都在 `index.html` 一个文件里，不需要装任何环境就能打开。

## 目录结构

```
Love_Proj/
├─ index.html          ← 网站入口（部署平台默认访问这个文件）
├─ assets/
│   └─ bgm.mp3         ← 背景音乐《今天你要嫁给我》（10.8 MB）
├─ 启动本地预览.bat     ← 双击即可在电脑起本地服务，方便手机同 WiFi 访问
└─ README.md
```

说明：`task.html` 是旧副本，内容和 `index.html` 一样，确认无误后可以删掉；以后只改 `index.html`。

---

## 一、电脑上看

直接双击 `index.html`，用 Chrome / Edge 打开即可。音乐会自动带上（放在 `assets/bgm.mp3`），点右下角播放键开始，唱片才会转。

> 音乐不会自动播放，这是浏览器的硬规则：必须有一次用户点击。

## 二、手机上看（同一个 WiFi，临时预览）

1. 双击 `启动本地预览.bat`，窗口里会显示 `Local: http://localhost:8000` 和一行本机 IPv4 地址（形如 `192.168.1.23`）。
2. 手机连上同一个 WiFi，浏览器打开 `http://192.168.1.23:8000`。
3. 第一次 Windows 会弹防火墙提示，勾选「专用网络」并允许。

这个方式只在开机 + 窗口没关时有效，换个 WiFi 就失效，适合自己预览，不适合发给别人。

## 三、发给别人、长期可迭代（推荐）

单页站点就是几个静态文件，任意静态托管都能跑。按你的情况推荐三条路：

### 方案 A：GitHub Pages（免费，最标准的"项目"做法）

1. 注册 GitHub，右上角 **New repository** → 名字 `love-proj` → 选 **Public** → Create。
2. 仓库页 **Add file → Upload files**，把 `index.html` 和整个 `assets` 文件夹拖进去（mp3 一起传，单文件 10MB 远低于 100MB 限制），Commit。
3. **Settings → Pages** → Source 选 **Deploy from a branch** → Branch 选 `main`、目录 `/ (root)` → Save。
4. 等 1–2 分钟，地址就是 `https://你的用户名.github.io/love-proj/`。
5. 迭代：本地改好 `index.html` → 网页上 Upload 覆盖（或 `git push`）→ 1 分钟自动更新，别人刷新就是最新版。
6. 手机端把链接发微信即可；想更像 App，浏览器菜单里「添加到主屏幕」。

> 后续想用 Git 管理版本：在文件夹里 `git init`，`.gitignore` 已经准备好了。

### 方案 B：Cloudflare Pages（拖拽上传，不用 Git）

1. 登录 `dash.cloudflare.com` → **Workers & Pages → Pages → Upload assets**。
2. 项目名随意，把整个 `Love_Proj` 文件夹拖进去，Deploy。
3. 得到 `https://xxx.pages.dev` 链接，速度比 GitHub Pages 在国内通常更稳。
4. 以后改完重新上传一次即可覆盖；也可以后续绑定 GitHub 仓库做到自动部署。

### 方案 C：国内云对象存储（阿里云 OSS / 腾讯云 COS）

适合给亲友群发、希望国内访问稳定：建 Bucket → 设为「公共读」→ 开启「静态网站托管」→ 上传 `index.html` + `assets` → 用平台给的默认域名访问（想用 `www.xxx.com` 这类好看域名需要已备案域名）。

### 方案 D：平台内发布（最快拿到链接）

在对话里让我把 `index.html` 直接发布成网页链接（豆包 html 链接），立刻可转发；缺点是每次更新要重新发布一次。

---

## 四、以后怎么改

| 想改什么 | 改哪里 |
|---|---|
| 流程、分工 | `index.html` 里 `script` 中的 `FLOW` 数组（每个节点一行，`roles` 下是十位角色） |
| 备婚清单 | `CHECKLIST` 数组；`done:true/false` 控制已完成 / 未完成 |
| 人员、车辆、场地 | `TEAM` / `CARS` / `VENUES` 数组 |
| 换背景音乐 | 新 mp3 改名 `bgm.mp3` 覆盖 `assets/bgm.mp3`，代码不用动 |
| 加图片 | 图片放 `assets/`，在 html 里用 `assets/图片名.jpg` 相对路径 |
| 留底 | 大改前把 `index.html` 复制到 `_backup/`（该目录不上传、不部署） |

## 五、常见问题

- **手机没声音**：先点播放键；iPhone 记得关掉侧边静音开关。
- **音乐 10.8MB 偏大**：建议压到 64–128kbps 的 mp3（约 3–5MB），手机加载更快，听感几乎没差别。
- **改了但看到的是旧页面**：托管和浏览器都有缓存，强制刷新或下拉刷新。
- **勾选状态不同步**：清单勾选存在每个人自己手机的浏览器里，别人打开是各自的进度，不会互相影响，也不会同步到你的设备。
- **隐私**：链接可能被转发，页面里别放手机号、身份证、具体住址等敏感信息。
