<?php

class SiteController extends Controller
{
	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */

	public function actionIndex()
	{	

		$my_t=gettimeofday(true);
		$views = md5($my_t);
		$_SESSION['views'] = $views;
		$this->render('index',array('views' => $_SESSION['views']));
	}
	public function actionList()
	{
		$this->render('list');
	}
	public function actionresult()
	{
		$this->render('result');
	}
	public function actionContact(){
		$this->render('contact');
	}

	public function actionhandler($action='null',$viewid="null")
	{	
		if($_SESSION['views'] == $viewid){
		$funfrom = new Handler();
		$result = $funfrom->$action();
		echo json_encode($result);
		}
		else{
		echo false;
		}
		Yii::app()->end();
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}

	public function actionTest($id)
	{
		$sql = "select * from same_store where id = ".intval($id);
		$store = Yii::app()->db->createCommand($sql)->queryRow();
		$this->render('store', array('store' => $store));
	}
}