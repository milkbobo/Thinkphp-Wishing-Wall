<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Strict//EN' 'http://www.w3.org/TR/html4/strict.dtd'>
<html>

<head>
    <meta http-equiv='Content-Type' content='text/html; charset='>
    <title>role</title>
    <link rel="stylesheet" href="__PUBLIC__/Css/public.css">

</head>

<body>
    <table>
        <tr>
            <th>ID</th>
            <th>角色名称</th>
            <th>角色描述</th>
            <th>操作</th>
        </tr>

        <?php if(is_array($role)): foreach($role as $key=>$v): ?><tr>
                <td><?php echo ($v["id"]); ?></td>
                <td><?php echo ($v["name"]); ?></td>
                <td><?php echo ($v["remark"]); ?></td>
                <td>
                    <?php if($v["status"]): ?>开启
                        <?php else: ?>关闭<?php endif; ?>
                </td>
                <td>
                    <a href="<?php echo U('Admin/Rbac/access',array('rid'=>$v['id']));?>">配置权限</a>
                </td>
            </tr><?php endforeach; endif; ?>

    </table>
</body>

</html>