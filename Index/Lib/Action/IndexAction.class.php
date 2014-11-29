<?php

class IndexAction extends Action{
	public function index(){
		
		$this->assign('wish',M('wish')->select())->display('wish');
		//$this->assign('wish',M('wish')->select())->display('wish');
		p(M('wish')->select());
	}
	
	public function handle(){
		if (!IS_POST) _404('非法操作，请重试',U('index'));
		$data = array(
			'username'=>I('username','','htmlspecialchars'),
			'content'=>I('content','','htmlspecialchars'),
			'time'=>time(),
		);
		if (M('wish')->data($data)->add()){
			$this->success('恭喜你提交成功',U('index'));
		}else {
			$this->error('提交失败，请重试。');
		}
	}
	
// 	public function handle(){
// 		//echo I('username','','htmlspecialchars');
// 		if (!IS_POST)_404('页面不存在111',U('index'));		
// 		$data = array(
// 				'username'=>I('username','','htmlspecialchars'),
// 				'content'=>I('content','','htmlspecialchars'),
// 				'time'=>time()
// 		);
		
// 		if(M('wish')->data($data)->add()){
// 			$this->success('发布成功','index');
// 		}else{
// 			$this->error('发布失败，请重试');
// 		}		
//	}
}


?>