<?php
session_start();
use abeautifulsite\SimpleImage;

/**
 * Created by PhpStorm.
 * User: zhenfeng
 * Date: 14-10-7
 * Time: PM6:57
 */
require 'config.php';
require 'helper/DBHelper.php';
require 'helper/SimpleImage.php';
require 'libs/analog/Analog.php';
define("TABLE","image");

$action = $_GET["action"];
$result = array();
$response = array();
try {
    switch ($action) {
    	case "upload":
    		$db = new DBHelper();
    		$file = $_FILES;
    		if(preg_match("%image%i", $file["fileInput"]["type"])){
    			$response["src"] = UPLOAD_DIR . uniqid() . '.jpg';
    			if(move_uploaded_file($file["fileInput"]["tmp_name"], $response["src"]))
    			{
    				$image = new SimpleImage($response["src"]);
    				$image->auto_orient();
    				$image->best_fit(1024, 768);
    				$image->save();
	                $result["src"] = $response["src"];
	                $result["intime"] = date('Y-m-d H:i:s', time());
	                $result["flag"] = 1;
	                if(@$id = $db->save(TABLE,$result))
	                {
	                    $response["code"] = 200;
	                    $response["id"] = $id;
	                }else{
	                    \Analog\Analog::debug("create upload Error:".json_encode($result));
	                    $response["code"] = 14;
	                }
    			}else{
    				$response["code"] = 12;
    			}
    		}else{
    			$response["code"] = 11;
    		}
    		ob_clean();
    		echo json_encode($response);
    		exit();
        case "update":
            $db = new DBHelper();
            $post = $_POST;
            $imageData = base64_decode($_POST["data"]);
            if(!empty($post["src"]) && !empty($imageData))
            {
                if(file_put_contents($post["src"],$imageData))
                {
                    $response["src"] = $post["src"];
                    $response["id"] = $post["id"];
                    $where = "id = ".$post["id"];
                    $result["flag"] = 2;
                    $result["utime"] = date('Y-m-d H:i:s',time());
                    for($i=0;$i<4;$i++)
                    {
                        $response["mark"][] = rand(20,25);
                    }
                    $result["marks"] = implode(",", $response["mark"]);
                    $response["total"] = $result["total"] = array_sum($response["mark"]);
                    if(@$id = $db->update(TABLE,$result, $where))
                    {
                        $response["code"] = 200;
                    }else{
                        \Analog\Analog::debug("update saveData Error:".json_encode($result));
                        $response["code"] = 14;
                    }
                }else{
                    \Analog\Analog::debug("update saveFile Error:".json_encode($result));
                    $response["code"] = 13;
                }
            }else{
                $response["code"] = 12;
            }
            ob_clean();
            echo json_encode($response);
            exit();
        case "getTop":
        	$db = new DBHelper();
        	$sql = "select src,total as score from ".TABLE." where total>0 order by flag desc,total desc,utime desc limit 8";
        	if(@$result = $db->findAll($sql))
        	{
        		$response["code"] = 200;
        		$response["data"] = $result;
        	}else{
                \Analog\Analog::debug("getTop Sql Error:".$sql);
        		$response["code"] = 14;
        	}
        	ob_clean();
        	echo json_encode($response);
        	exit();
		case "star":
			$db = new DBHelper();
			$post = $_POST;
			if($_SESSION["auth"] && !empty($post["id"])){
				$where = "id = ".$post["id"];
				$post["utime"] = date("Y-m-d H:i:s",time());
				if($db->update(TABLE,$post,$where)){
					$response["code"] = 200;
				}else{
                    \Analog\Analog::debug("star Error:".json_encode($post));
					$response["code"] = 12;
				}
			}else{
				$response["code"] = 11;
			}
			ob_clean();
			echo json_encode($response);
			exit();
		case "remove":
			$db = new DBHelper();
			$post = $_POST;
			if($_SESSION["auth"] && !empty($post["id"])){
				$where = "id = ".$post["id"];
				$image = $db->getOneField("select src from ".TABLE." where ".$where);
				if($db->delete(TABLE,$where)){
					if(file_exists($image))
					{
						unlink($image);
					}
					$response["code"] = 200;
				}else{
					\Analog\Analog::debug("star Error:".json_encode($post));
					$response["code"] = 12;
				}
			}else{
				$response["code"] = 11;
			}
			ob_clean();
			echo json_encode($response);
			exit();
    }
}catch (exception $e){
    \Analog\Analog::error($e.",resp:".json_encode($response).",result:".json_encode($result));
    $response["code"] = 503;
    ob_clean();
    echo json_encode($response);
    exit;
}