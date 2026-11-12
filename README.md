# 婚礼筹备网页 · 项目说明

小叶 & 小倪 婚礼筹备总览（单页网站）。所有样式、交互、数据都在 `index.html` 一个文件里，不需要装任何环境就能打开。

**线上地址**：<https://qfye3480.github.io/20271002/>
**备用地址**：<https://4mg0kbptf6a2p.doubao.link/app/app_17hva4j9r98>（GitHub 打不开时用这条，内容一样）

## 目录结构

```
Love_Proj/
├─ index.html          ← 网站入口（GitHub Pages 根目录默认访问这个文件）
├─ assets/
│   └─ bgm.mp3         ← 背景音乐《今天你要嫁给我》（10.8 MB）
├─ 启动本地预览.bat     ← 双击即可在电脑起本地服务，方便手机同 WiFi 访问
└─ README.md
```

说明：`task.html` 是改版前的旧副本，已加入 `.gitignore`，确认无误后可删；以后只改 `index.html`。

---

## 一、电脑上看

直接双击 `index.html`，用 Chrome / Edge 打开即可。音乐来自 `assets/bgm.mp3`，点首屏右侧唱片卡上的「播放」开始，黑胶才会转。

> 音乐不会自动播放，这是浏览器的硬规则：必须有一次用户点击。

## 二、手机上看（同一个 WiFi，临时预览）

1. 双击 `启动本地预览.bat`，窗口里会显示 `Local: http://localhost:8000` 和一行本机 IPv4 地址（形如 `192.168.1.23`）。
2. 手机连上同一个 WiFi，浏览器打开 `http://192.168.1.23:8000`。
3. 第一次 Windows 会弹防火墙提示，勾选「专用网络」并允许。

这个方式只在开机 + 窗口没关时有效，换个 WiFi 就失效，适合自己预览，不适合发给别人。

## 三、线上发布（已配置好，日常只需要 push）

仓库：<https://github.com/qfye3480/20271002>（公开仓库，分支 `main`）
托管：GitHub Pages，源为 `main` 根目录，已开启，改完 push 后 1–2 分钟自动生效。

### 更新流程

```powershell
cd C:\Users\Administrator\Desktop\Love_Proj
git add -A
git commit -m "说明这次改了什么"
git push
```

- 远端已是 HTTPS 形式，`qfye3480` 的 token 存进了 Windows 凭据管理器，push 不需要再输密码。
- 推送完成后到 <https://qfye3480.github.io/20271002/> 刷新（或手机下拉刷新）就是最新版，链接永远不变。
- 想发微信群：直接把上面那条链接发出去即可；iOS 可在 Safari 里「添加到主屏幕」，看起来像 App。

### GitHub 网页打不开怎么办

这台网络环境下 `github.com` 网页经常超时，但 `api.github.com` 和 `ssh.github.com:443` 通常仍可用（`~/.ssh/config` 已把 github.com 的 SSH 指向 443）。所以：

- **推代码**：走 HTTPS + 已存的 token，不受网页封锁影响。
- **改仓库设置 / 开 Pages**：可以让我用 GitHub API 改，或用手机流量试。
- **只想让人看页面**：`.github.io` 域名本身是通的，链接照发。

### 备用发布通道

每次页面大改后，也可以让我用平台发布能力重新推一份到豆包链接（同一个 `app_id`，URL 固定，内容更新）。GitHub 完全不可用时，这条链接是兜底。

## 四、以后怎么改

| 想改什么 | 改哪里 |
|---|---|
| 流程、分工 | `index.html` 里 `script` 中的 `FLOW` 数组（每个节点一行，`roles` 下是角色键） |
| 角色名单 | `ROLES` 数组（决定泳道表有几列） |
| 备婚清单 | `CHECKLIST` 数组；`done:true/false` 控制已完成 / 未完成 |
| 人员、车辆、场地 | `TEAM` / `CARS` / `PITS` / `VENUES` 数组 |
| 婚期倒计时 | `renderCountdown()` 里的 `2027-10-02T00:00:00+08:00` |
| 换背景音乐 | 新 mp3 改名 `bgm.mp3` 覆盖 `assets/bgm.mp3`，代码不用动 |
| 加图片 | 图片放 `assets/`，在 html 里用 `assets/图片名.jpg` 相对路径 |
| 留底 | 大改前把 `index.html` 复制到 `_backup/`（该目录不上传、不部署） |

## 五、常见问题

- **手机没声音**：先点首屏唱片卡上的「播放」；iPhone 记得关掉侧边静音开关。
- **音乐 10.8MB 偏大**：建议压到 64–128kbps 的 mp3（约 3–5MB），手机首屏更快，听感几乎没差别。压缩后覆盖 `assets/bgm.mp3` 再 push 即可。
- **改了但看到的是旧页面**：Pages 构建 1–2 分钟，加上浏览器缓存，稍等并强制刷新。
- **勾选状态不同步**：清单勾选存在每个浏览者自己的浏览器里，各看各的进度，不会互相同步，也不会回写到 `index.html`。
- **隐私**：链接可能被转发，页面里别放手机号、身份证、具体住址等敏感信息。
- **token 失效**：GitHub 的 token 有有效期，过期后 push 会报 403/认证失败，去 Settings → Developer settings → Personal access tokens 重新生成，把新 token 给我，我更新凭据即可。
