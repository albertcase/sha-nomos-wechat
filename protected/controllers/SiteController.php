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
		$this->render('index',array('views' => $views));
	}
	public function actionList()
	{
		$funfrom = new Handler();
		$results = $funfrom->getTop();
		$this->render('list',$results);
	}
	public function actionresult()
	{
		$this->render('result');
	}
	public function actionContact(){
		$this->render('contact');
	}

	public function actionhandler($action='null',$viewid='null')
	{	
		$router = array("upload","update");
		if(in_array($action,$router)){
			if($_SESSION['views'] != $viewid){
			echo false;
			Yii::app()->end();
			}
		}
		$funfrom = new Handler();
		$result = $funfrom->$action();
		echo json_encode($result);
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

	public function actionTest()
	{
		echo $_SESSION['views'];
		Yii::app()->end();
	}
}