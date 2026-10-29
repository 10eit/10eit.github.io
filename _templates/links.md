# 三种链接写法

## 普通 Markdown 链接

```markdown
[Weak learning to rank](https://journals.aps.org/prc/abstract/10.1103/PhysRevC.111.034329)
```

## 引用卡片

```liquid
{% include link-card.html url="https://journals.aps.org/prc/abstract/10.1103/PhysRevC.111.034329" title="Weak learning to rank" source="journals.aps.org/prc/abstract/10.1103/PhysRevC.111.034329" %}
```

`title` 是卡片第一行，`source` 是下面的灰色来源文字。省略它们时，两行都会回退为完整 URL。

## 论文条目（左图右文）

```liquid
{% include publication.html paper=site.data.publications.linguistic_processing %}
```

论文信息放在 `_data/publications.yml`，包括标题、论文网址、配图路径、原图宽高和替代文字、作者、期刊、年份及阅读链接。给自己的作者条目设置 `highlight: true` 可加粗姓名；作者的 `url` 可选。配图放在 `assets/images/`。桌面端由文字决定条目高度，配图在同一高度内等比例缩放；手机上会自动改为上图下文，图片按正文宽度缩放。
