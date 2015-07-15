<?php

include "SimpleImage.php";

class Handler{

	    private $request;
	    private $sqlfrom;
	    private $tablefrom = "image";
	    private $upload_dir = "upload/"; //image save folder
	    
	    public function __construct(){
		    $this->sqlfrom = Yii::app()->db;
	  }
	    
	    public function upload(){
			 $file = $_FILES;
			 $response = array();
			 $result = array();
			  if(preg_match("%image%i", $file["fileInput"]["type"])){
					$response["src"] = $this->upload_dir. uniqid() . '.jpg';
			  if(move_uploaded_file($file["fileInput"]["tmp_name"], $response["src"]))
    			{
				$image_size   =   getimagesize($response["src"]); 
    				$image = new SimpleImage($response["src"],$image_size[0],$image_size[1],'#FFCC00');
    				$image->best_fit(1024, 768);
    				$image->save();
				$result["src"] = $response["src"];
				$result["intime"] = date('Y-m-d H:i:s', time());
				$result["flag"] = 1;
				$resultid = $this->Sqlinsert($this->tablefrom,$result);
				      if($resultid){
					      $response["code"] = 200;
					      $response["id"] = $resultid;
				      }else{
						      $response["code"] = 14;
				      }
    			}else{
    				$response["code"] = 12;
    			}
			}else{
    			$response["code"] = 11;
			}
			ob_clean();
			return  $response;	
	    }
	    
	    public function update(){
			$post = $_POST;
			$imageData = base64_decode($_POST["data"]);
			if(!empty($post["src"]) && !empty($imageData))
			{
			    if(file_put_contents($post["src"],$imageData))
				{
				    $response["src"] = $post["src"];
				    $response["id"] = $post["id"];
				    $where = array(":id"=> $post["id"]);
				    $result["flag"] = 2;
				    $result["utime"] = date('Y-m-d H:i:s',time());
				    for($i=0;$i<4;$i++)
					{
					    $response["mark"][] = rand(20,25);
					}
				    $result["marks"] = implode(",", $response["mark"]);
				    $response["total"] = $result["total"] = array_sum($response["mark"]);
				    if($this->Sqlupdate($this->tablefrom,$result, $where))
					 {
					    $response["code"] = 200;
					 }else{
						  $response["code"] = 14;
					  }
			      }else{
					  $response["code"] = 13;
				}
			 }else{
				    $response["code"] = 12;
			    }
		  ob_clean();
		  
		  return $response;
	    }
	    
	    public function getTop(){
	    $sql = "select src,total as score from ".$this->tablefrom." where total>0 order by flag desc,total desc,utime desc limit 8";
        	if($result = $this->Sqlselectall($sql))
        	{
        		$response["code"] = 200;
        		$response["data"] = $result;
        	}else{
        		$response["code"] = 14;
        	}
        	ob_clean();
        	return $response;
	    }
	    
	    public function star(){
	    $post = $_POST;
			if($_SESSION["auth"] && !empty($post["id"])){
				$where = "id = ".$post["id"];
				$post["utime"] = date("Y-m-d H:i:s",time());
				if($this->Sqlupdate($this->tablefrom,$post,$where)){
					$response["code"] = 200;
				}else{
					$response["code"] = 12;
				}
			}else{
				$response["code"] = 11;
			}
			ob_clean();
			return $response;
	    }
	    
	    public function remove(){
	    $post = $_POST;
			if($_SESSION["auth"] && !empty($post["id"])){
				$where = "id = ".$post["id"];
				$image = $this->Sqlselectone("select src from ".$this->tablefrom." where ".$where);
				if($this->Sqldelete($this->tablefrom,$where)){
					if(file_exists($image))
					{
						unlink($image);
					}
					$response["code"] = 200;
				}else{
					$response["code"] = 12;
				}
			}else{
				$response["code"] = 11;
			}
			ob_clean();
			return $response;
	    }
	    
	   public function Sqlinsert($table,array $data = array()){
	
		      $this->sqlfrom->createCommand()->insert($table, $data);
		      return $this->sqlfrom->getLastInsertID();
	   }
	   
	   public function Sqlupdate($table,array $data = array(),$where){
		      $result = $this->sqlfrom->createCommand()->update($table, $data,'id=:id',$where);
		      if($result){
		      return true;
		      }
		      else {
		      return false;
		      }
	   }
	   
	   public function Sqlselectall($sql){
		    $result = $this->sqlfrom->createCommand($sql)->queryAll();
		    return $result;
	   }
	    
	  public function Sqlselectone($sql){
		    $result = $this->sqlfrom->createCommand($sql)->queryRow();
		    return $result;
	   }
	   
	   public function Sqldelete($table,$where=""){
		    $result = $this->sqlfrom->createCommand()->delete($table, $where);
		    return $result;
	   }

}
	   