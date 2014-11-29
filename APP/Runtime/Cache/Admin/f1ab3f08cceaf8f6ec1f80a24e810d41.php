<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Strict//EN' 'http://www.w3.org/TR/html4/strict.dtd'>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset='>
<title>表格</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/Css/public.css" />
<!--<script type="text/javascript" src="__PUBLIC/Js/jquery-1.7.2.min.js"></script>-->
</head>
<body>
<table class="table">
    <tr>
        <th>ID</th>
        <th>发布者</th>
        <th>内容</th>
        <th>发布时间</th>
        <th>操作</th>
    </tr>
    <?php if(is_array($wish)): foreach($wish as $key=>$v): ?><tr>
            <td><?php echo ($v["id"]); ?></td>
            <td><?php echo ($v["username"]); ?></td>
            <td><?php echo (replace_phiz($v["content"])); ?></td>
            <td><?php echo (date('y-m-d H:i',$v["time"])); ?></td>
            <td><a href="<?php echo U("Admin/MsgManage/delete",array(id=>$v['id']));?>" onclick="return confirm('你真的要删除这个贴子吗？')? true :false">删除</a></td>
        </tr><?php endforeach; endif; ?>

  
                <tr>
                    <td colspan="5" align='center'><?php echo ($page); ?></td>
                </tr>
</table>
</body>
</html>