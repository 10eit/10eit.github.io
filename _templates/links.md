# 两种链接写法

## 普通 Markdown 链接

```markdown
[Weak learning to rank](https://journals.aps.org/prc/abstract/10.1103/PhysRevC.111.034329)
```

## 引用卡片

```liquid
{% include link-card.html url="https://journals.aps.org/prc/abstract/10.1103/PhysRevC.111.034329" title="Weak learning to rank" source="journals.aps.org/prc/abstract/10.1103/PhysRevC.111.034329" %}
```

`title` 是卡片第一行，`source` 是下面的灰色来源文字。省略它们时，两行都会回退为完整 URL。
