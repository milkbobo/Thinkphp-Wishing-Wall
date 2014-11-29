<?php if (!defined('THINK_PATH')) exit();?><?xml version='1.0' encoding='' ?>
<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Insert title here</title>

<link rel="stylesheet" href="__PUBLIC__/Css/public.css">
</head>
<body>
<table>
    <tr>
        <td>ID</td>
        <td>用户名称</td>
        <td>上一次登陆时间</td>
        <td>上一次登陆IP</td>
        <td>锁定状态</td>
        <td>用户所属组别</td>
        <td>操作</td>
    </tr>
    
    <?php if(is_array($user)): foreach($user as $key=>$v): ?><tr>
            <td><?php echo ($v["id"]); ?></td>
            <td><?php echo ($v["username"]); ?></td>
            <td><?php echo (date('y-m-d H:i',$v["logintime"])); ?></td>
            <td><?php echo ($v["loginip"]); ?></td>
            <td><?php if($v["lock"]): ?>锁定<?php endif; ?></td>
            <td>
               <?php if($v["username"] == C("RBAC_SUPERADMIN")): ?>超级管理员
               <?php else: ?>
               
                <ul>
                    <?php if(is_array($v["role"])): foreach($v["role"] as $key=>$value): ?><li><?php echo ($value["name"]); ?>(<?php echo ($value["remark"]); ?>)</li><?php endforeach; endif; ?>
                </ul><?php endif; ?>
            </td>
            <td>
                <a href="">锁定</a>
            </td>
        </tr><?php endforeach; endif; ?>
    
</table>
</body>
</html>