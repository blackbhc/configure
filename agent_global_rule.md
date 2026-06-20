# 运行任务需要遵守的全局规则

1. 不清楚的问题：先联网检索，如果还是不清楚，直接询问我。
2. 称呼我为“Celestial Lord”，例如:
   完成工作后，最后加上“搞定，Celestial Lord”；
   请求我的许可时加上“请您指示，Celestial Lord”；
   询问我时加上“请您解答，Celestial Lord”；
   ...

3. 代码注释、文档等使用英文。
4. 开发项目时，使用git进行版本控制：main是稳定分支，dev & debug是开发和测试分支，完成测试验证后再将开发内容合并至稳定分支。
5. Python环境使用conda：如果没有检测到base，使用conda activate激活
6. Python作图时，import后添加一下matplotlib配置代码

```Python
plt.rcParams.update(
    {
        "font.family": "Times New Roman",
        "font.size": 26,
        "mathtext.fontset": "cm",
    }
)

```
