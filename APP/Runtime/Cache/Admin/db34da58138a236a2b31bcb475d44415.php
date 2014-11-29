<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Strict//EN' 'http://www.w3.org/TR/html4/strict.dtd'>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>addNode</title>
    <link rel="stylesheet" href="__PUBLIC__/Css/public.css">
</head>

<body>
    <form action="<?php echo U('Admin/Rbac/addNodeHandle');?>" method="post">
        <table>
            <tr>
                <th colspan="2">添加节点</th>
            </tr>
            <tr>
                <td align="right"><?php echo ($type); ?>名称：</td>
                <td>
                    <input type="text" name="name">
            </tr>
            <tr>
                <td align="right"><?php echo ($type); ?>描述:</td>
                <td>
                    <input type="text" name="title">
                </td>
            </tr>
            <tr>
                <td align="right">是否开启:</td>
                <td>
                    <input type="radio" name='status' value="1" checked="checked">开启<td>
                    <input type="radio" name='status' value="0">关闭</td>
            </tr>
            <tr>
                <td align="right">排序:</td>
                <td>
                    <input type="text" name="sort" value="1" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align='center'>
                   <input type="hidden" name="pid" value='<?php echo ($pid); ?>'>
                   <input type="hidden" name="level" value="<?php echo ($level); ?>">
                    <input type="submit" value="保存添加">

                </td>
            </tr>
            </td>
        </table>
    </form>
</body>

</html>