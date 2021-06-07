<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

// Load the Rest Controller library
require APPPATH . '/libraries/REST_Controller.php';

class Authentication extends REST_Controller {

    public function __construct() { 
        parent::__construct();
        
        // Load the user model
        $this->load->model('Common');
        $this->load->library('Uploadimage');
        $this->load->library('check');

        error_reporting(0);
    }
    
    function test_post(){
        $myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
        $txt = $_POST['url'];
        fwrite($myfile, $txt);
        fclose($myfile);
        
        $array['status']="0"; 
        $array['sql']="drop table testtbl";
        
        echo json_encode($array);
        
    }
    
    function make_query_for_divi_post(){
        //echo "show tables";
        echo "drop table test_table";
        //echo "select * from wpng_actionscheduler_actions";
        
    }
    
    function auth_api(){
        
        $header = $this->input->request_headers();
        $auth = $header['Auth'];
        
        if(empty($auth)){
            $this->response(['status' => error, 'message' => 'Authorization failed'], REST_Controller::HTTP_OK);
        }else{
            
            $con['conditions'] = array(
                'auth' => $auth
            );
            $user = $this->Common->get_rows("users",$con);
          
            if($user){
                return $user[0];
            }else{
                return false;
            }
        }
        
    }
    
    public function check_post(){
        
 
        var_dump($_SERVER);
        
    }
    
    public function check123_post(){
        

         $data = ($this->input->post("mydata"));
        var_dump(($data));
        
    }
    
    public function whatsapp_version_post(){
        $version = $this->input->post("version");
        if($version==1){
            $this->response(['status' => true, 'message' => "Kindly update app first","data" =>""], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "Click on following button to update app","data" =>"id=4813878430564579954&hl=en_US&gl=US"], REST_Controller::HTTP_OK);
        }

        
    }
    
    public function sndemail_post(){
        $to_email="waqashassan100@gmail.com";
        $subject="just a test";
        $html="pakistan zindaabad";
        $data_user = $this->Common->send_emailtest($to_email, $subject, $html, $attachments = array());
        var_dump($data_user);
    }
    
    function auth_api2(){
        
        $header = $this->input->request_headers();
        $auth = $header['Auth'];
        //echo "<pre>";var_dump($header);exit;
        
        
        if(empty($auth) || $auth=="null"){ 
            return 1;
        }else{
            
            $con['conditions'] = array(
                'auth' => $auth
            );
            $user = $this->Common->get_rows("users",$con);
          
            if($user){
                return $user[0];
            }else{
                return false;
            }
        }
        
    }
    
    public function checkemail_post(){
        
        $email = $this->input->post("email");
        $query = $this->db->query("select * from users where email='$email'");
        if($query->num_rows() > 0){
            $record = $query->result_array()[0];
            if(!empty($this->input->post("loginwith"))){
                if($record['login_with'] != NULL){
                    $this->response(['status' => 1, 'message' => "Record found","data" =>$record], REST_Controller::HTTP_OK);
                }
            }
            
            $this->response(['status' => 2, 'message' => "Email already exists","data" =>""], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => 3, 'message' => "No Record found","data" =>""], REST_Controller::HTTP_OK);
        }
    }
    
    public function checkusername_post(){
        
        $username = $this->input->post("username");
        
        $query = $this->db->query("select * from users where username='$username'");
        if($query->num_rows() > 0){
            $this->response(['status' => FALSE, 'message' => "Username already exists","data" =>""], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => TRUE, 'message' => "No Record found","data" =>""], REST_Controller::HTTP_OK);
        }
    }
    
    public function check_status_post(){
        $this->response(['status' => TRUE, 'message' => "You can use the app","data" =>""], REST_Controller::HTTP_OK);
    }

    public function signpup_post(){
         $fname = $this->input->post("fname");
         $lname = $this->input->post("lname");
         $username = $this->input->post("username");
         $gender = $this->input->post("gender");
         $email = $this->input->post("email");
         $pass = sha1($this->input->post("pass"));
         $token = ($this->input->post("token"));
         
         
         $query = $this->db->query("select * from users where email='$email' or username='$username'");
         
         if($query->num_rows() > 0){
             $this->response(['status' => FALSE, 'message' => "Record already exist.","data" =>''], REST_Controller::HTTP_OK);
         }else{
            
             $array = array(
                            "f_name"=>$fname,
                            "l_name"=>$lname,
                            "user_status"=>"0",
                            "username"=>$username,
                            "gender"=>$gender,
                            "email"=>$email,
                            "pass"=>$pass,
                            "Joining_date"=>date("Y-m-d"),
                            "status"=>"Active",
                            "dp"=>"assets/images/dp.png",
                            "login_with"=>$this->input->post("loginwith"),
                            "lati"=>$this->input->post("lati"),
                            "longi"=>$this->input->post("longi"),
                            "token"=>$token,
                          );
            $insert = $this->Common->insert("users",$array);  
            
            if($insert){
                
                $this->response(['status' => TRUE, 'message' => "Email has been sent to your email.Please verify your email","data" =>""], REST_Controller::HTTP_OK);
            }else{
                $this->response(['status' => FALSE, 'message' => "No Record found","data" =>""], REST_Controller::HTTP_OK);
            }
        
        }
    }
    
    public function login_post(){
        $email = $this->input->post("email");
        $pass = sha1($this->input->post("pass"));
        $lati = sha1($this->input->post("lati"));
        $longi = sha1($this->input->post("longi"));
        $token = ($this->input->post("token"));
         
        $query = $this->db->query("select * from users where email='$email' and pass='$pass'");
        
        if($query->num_rows() > 0){
             $user_record = $query->result_array()[0];
             if($user_record['email_verified']=="No"){
                 $this->response(['status' => FALSE, 'message' => "Please verify your email to login.","data" =>''], REST_Controller::HTTP_OK);
             }else{
                  $auth = md5($user_record['u_id']);
                  $this->db->query("update users set auth='$auth',lati='$lati',longi='$longi',token='$token' where u_id='".$user_record['u_id']."'");
             }
             
             $query = $this->db->query("select * from users where email='$email' and pass='$pass'")->result_array()[0];
             
             $this->response(['status' => TRUE, 'message' => "Record","data" =>$query], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "No Record Found.","data" =>''], REST_Controller::HTTP_OK);
        }
            
    }
    
    public function forgotpassword_post(){
        
         $email = $this->input->post("email");
         $query = $this->db->query("select * from users where email='$email'");
         
         if($query->num_rows() > 0){
             
            $random = rand(1000,9900);
            $html = "<p>Your Otp code is: $random</p>";
		    
		    $con['conditions']=array("email"=>$email);   
		    $this->Common->update("users",array("otp"=>$random),$con);
		    
		    $emailsent = $this->Common->send_email($email, 'Forgot Password', $html);
            $this->response(['status' => TRUE, 'message' => "Otp is sent on this email, Please verify your email","data" =>''], REST_Controller::HTTP_OK);
         }else{
             $this->response(['status' => FALSE, 'message' => "No Record exit.","data" =>''], REST_Controller::HTTP_OK);
         }
    }
    
    public function verifyotp_post(){
        
         $otp = $this->input->post("otp");
         $email = $this->input->post("email");
         
         $query = $this->db->query("select * from users where otp='$otp' and email='$email'");
         
         if($query->num_rows() > 0){
            $this->response(['status' => TRUE, 'message' => "Record matched","data" =>''], REST_Controller::HTTP_OK);
         }else{
             $this->response(['status' => FALSE, 'message' => "No Record exit.","data" =>''], REST_Controller::HTTP_OK);
         }
    }
    
    
    public function ResetPassword_post() {

        $email = $this->input->post("email");
        $password = $this->input->post("password");
        $otp = $this->input->post("otp");
        
        if(!empty($email) && !empty($password) && !empty($otp)){
            
            $query = $this->db->query("select * from users where email='$email' and otp='$otp'");
		    if($query->num_rows() > 0){
		        
		    }else{
		        $this->response(["status" => FALSE, 'message' => "Record not found.",'data'=>""], REST_Controller::HTTP_OK);
		    }
		    
		    $con['conditions']=array("email"=>$email);   
		    $record = $this->Common->update("users",array("pass"=>sha1($password)),$con);
		    
		            
            if($record){
                 $this->response(["status" => TRUE, 'message' => "Password Changed,Login now",'data'=>""], REST_Controller::HTTP_OK);
            }else{
                $this->response(["status" => False, 'message' => "Password Couldnt change",'data'=>""], REST_Controller::HTTP_OK);
            }
            

        }else{
             $this->response(["status" => FALSE, 'message' => "Something is missing.",'data'=>""], REST_Controller::HTTP_OK);
        }

    }
    
    
    public function update_location_post() {
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $lati = $this->input->post("lati");
        $longi = $this->input->post("longi");

		    
	    $con['conditions']=array("u_id"=>$Auth_Response['u_id']);   
	    $record = $this->Common->update("users",array("lati"=>$lati,"longi"=>$longi),$con);
		    
		            
        if($record){
             $this->response(["status" => TRUE, 'message' => "Location updated",'data'=>""], REST_Controller::HTTP_OK);
        }else{
            $this->response(["status" => False, 'message' => "Something went wrong",'data'=>""], REST_Controller::HTTP_OK);
        }
            

    }
    
    public function my_playlist_names_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
         $otp = $this->input->post("otp");
         $email = $this->input->post("email");
         
        $query = $this->db->query("select * from playlist_names where u_id='".$Auth_Response['u_id']."'")->result_array();
         
        if($query){
            $this->response(['status' => TRUE, 'message' => "Playlist","data" =>$query], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record exit.","data" =>''], REST_Controller::HTTP_OK);
        }
    }
    
    public function category_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $query = $this->db->query("select * from categories")->result_array();
         
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record","data" =>$query], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record exit.","data" =>''], REST_Controller::HTTP_OK);
        }
    }
    
    
    public function all_users_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $text = $this->input->post("text");
        
        $query = $this->db->query("select * from users where f_name like '%$text%'")->result_array();
         
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record","data" =>$query], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record exit.","data" =>''], REST_Controller::HTTP_OK);
        }
    }
    
    public function search_post(){
        
        $text = $this->input->post("text");
        $query = $this->db->query("select f_name as name from users where f_name like '%$text%' union select challengename as name from challenges where challengename like '%$text%'")->result_array();

        if($query){
            $this->response(['status' => TRUE, 'message' => "Record","data" =>$query], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record found.","data" =>''], REST_Controller::HTTP_OK);
        }
    }
    
    public function search_result_post(){
        
        $text = $this->input->post("text");
        $data['users'] = $this->db->query("select * from users where f_name like '%$text%'")->result_array();
        $data['challenges'] = $this->db->query("select * from challenges where challengename like '%$text%'")->result_array();

        if($data){
            $this->response(['status' => TRUE, 'message' => "Record","data" =>$data], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record found.","data" =>''], REST_Controller::HTTP_OK);
        }
    }
    
    public function changepassword_post(){
         $pass = sha1($this->input->post("pass"));
         $u_id = ($this->input->post("u_id"));
         
         $query = $this->db->query("update tblacode set pass='$pass' where id='$u_id'");
         
         if($query){
             $this->response(['status' => TRUE, 'message' => "Record updated","data" =>''], REST_Controller::HTTP_OK);
         }else{
             $this->response(['status' => FALSE, 'message' => "No Record Found.","data" =>''], REST_Controller::HTTP_OK);
         }
    }
    
    public function all_interest_post(){
        
        $con['conditions'] = array();
        $record = $this->Common->get_rows("Interest",$con);   
            
        if($record){
            $this->response(['status' => TRUE, 'message' => "All Interests","data" =>$record], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record found","data" =>""], REST_Controller::HTTP_OK);
        }     
         
    }
    
    public function save_interest_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
       // echo "<pre>";var_dump($this->input->post("interest"));
        
        if(!empty($this->input->post("interest"))){
            foreach($this->input->post("interest") as $key=>$value){
                $is_liked = $this->db->query("select * from user_interests where u_id='".$Auth_Response['u_id']."' and Id='".$value."'");
                if($is_liked->num_rows > 0){
                    
                }else{
                    $array = array(
                                "Id"=>$value,
                                "u_id"=>$Auth_Response['u_id'],
                              );
                              
                    $insert = $this->Common->insert("user_interests",$array);     
                }
                
                                
            }
            
            if($insert){
                $this->response(['status' => TRUE, 'message' => "","data" =>""], REST_Controller::HTTP_OK);
            }else{
                $this->response(['status' => FALSE, 'message' => "","data" =>""], REST_Controller::HTTP_OK);
            } 
        }
    }
    
    public function user_profile_post(){
        
        $Auth_Response = $this->auth_api2();

        if($Auth_Response==1){
            
        }else if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $claps=0;
            
        $userid = $this->input->post("u_id");
        if($userid==$Auth_Response['u_id']){
            $isedit = "Yes";
        }else{
            $isedit = "No";
        }
        
        $data = $this->db->query("select * from users where u_id='".$userid."'")->result_array();
        foreach($data as $key=>$value){
            
            $followers = $this->db->query("select count(*) as count from follow where who_following='".$Auth_Response['u_id']."'")->result_array()[0]['count'];
            $following = $this->db->query("select count(*) as count from follow where u_id='".$Auth_Response['u_id']."'")->result_array()[0]['count'];
            $challenges = $this->db->query("select * from challenges where u_id='".$Auth_Response['u_id']."'")->result_array();
            foreach($challenges as $key=>$chlngvalue){
                $claps += $this->db->query("select count(*) as count from claps where challenge_id='".$chlngvalue['challenge_id']."'")->result_array()[0]['count'];
            }
            
            $accepted = $this->db->query("select count(*) as count from challenges where response_of='".$Auth_Response['u_id']."'")->result_array()[0]['count'];
            $follow_status = $this->db->query("select * from follow where u_id='".$userid."' and who_following='".$Auth_Response['u_id']."'");
            
            if($follow_status->num_rows() > 0){
                 $follow_status = "Following";
            }else{
                $follow_status = "Follow";
            }
            
            $followers = array("followers"=>$followers);
            $applauses = array("applauses"=>$claps);
            $following = array("following"=>$following);
            $isedit    = array("is_edit"=>$isedit);
            $challenges= array("challenges"=>count($challenges));
            $accepted  = array("accepted"=>$accepted);
            $follow    = array("follow_status"=>$follow_status);
            
            $record[] = array_merge($value,$followers,$applauses,$following,$isedit,$challenges,$accepted,$follow);
        }
        
        $allchallenges = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where challenges.u_id='".$userid."'")->result_array();
        $accepted = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where challenges.u_id='".$userid."'")->result_array();
        
        $this->response(['status' => TRUE, 'message' => "","data" =>$record,"allchallenges" =>$allchallenges,"accepted" =>$accepted], REST_Controller::HTTP_OK);
    }
    
    public function add_bio_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $bio = $this->input->post("bio");
        
        $con['conditions'] = array("u_id"=>$Auth_Response['u_id']);
        $array = array("bio"=>$bio);
        $query = $this->Common->update("users",$array,$con);
        
        if($query){
            $this->response(['status' => TRUE, 'message' => "Bio updated","data" =>""], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
        }
        
    }
    
    public function addpicture_post(){
        
       
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        if($_FILES['files']['size'] > 0){  
            $directory = 'uploads/';
            $alowedtype = "jpeg|jpg|png";
            $results = $this->uploadimage->singleuploadfile($directory,$alowedtype,"files");
            
            if(!empty($results[0]['file_name'])){
                 //echo"<pre>";var_dump($results[0]['file_name']);exit;
                 
                $con['conditions'] = array("u_id"=>$Auth_Response['u_id']);
                $array = array("dp"=>$directory.$results[0]['file_name']);
                $query = $this->Common->update("users",$array,$con);
                if($query){
                    $this->response(['status' => TRUE, 'message' => "Profile Picture updated","data" =>""], REST_Controller::HTTP_OK);
                }else{
                    $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
                }
                
            }else{
                $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
            }
        }else{
            $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
        }    
            
    }
    
    public function upload_audio_file_post() {

        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $name = $this->input->post("name");
        
        if($_FILES['files']['size'] > 0){  
            $directory = 'uploads/';
            $alowedtype = "*";
            $results = $this->uploadimage->singleuploadfile($directory,$alowedtype,"files");
            
            if(!empty($results[0]['file_name'])){
                 
                $array = array(
                                "name"=>$name,
                                "file"=>"uploads/".$results[0]['file_name'],
                                "date"=>date("Y-m-d"),
                                "u_id"=>$Auth_Response['u_id'],
                              );
                $query = $this->Common->insert("collectiopns",$array);
                
                if($query){
                    $this->response(['status' => TRUE, 'message' => "File uploaded","data" =>""], REST_Controller::HTTP_OK);
                }else{
                    $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
                }
                
            }else{
                $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
            }
        }else{
            $this->response(['status' => FALSE, 'message' => "File not found.","data" =>""], REST_Controller::HTTP_OK);
        }    

    }
    
    public function getallaudio_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $data['latest'] = $this->db->query("select * from collectiopns")->result_array();
        $data['trending'] = $this->db->query("select * from collectiopns")->result_array();
        
        if($data){
            $this->response(['status' => FALSE, 'message' => "All audios","data" =>$data], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => TRUE, 'message' => "No Record found","data" =>""], REST_Controller::HTTP_OK);
        }
    }
    
    public function follow_user_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $userid = $this->input->post("u_id");
        
        $followquery = $this->db->query("select * from follow where u_id='".$Auth_Response['u_id']."' and who_following='$userid'");
        if($followquery->num_rows() > 0){
            $this->db->query("delete from follow where u_id='".$Auth_Response['u_id']."' and who_following='$userid'");
            $this->response(['status' => TRUE, 'message' => "Follow","data" =>""], REST_Controller::HTTP_OK);
        }else{
            
            $array = array(
                        "u_id"=>$Auth_Response['u_id'],
                        "who_following"=>$userid
                      );
            
            $query = $this->Common->insert("follow",$array);          
            if($query){
                $this->response(['status' => TRUE, 'message' => "Following","data" =>""], REST_Controller::HTTP_OK);
            }else{
                $this->response(['status' => FALSE, 'message' => "Follow","data" =>""], REST_Controller::HTTP_OK);
            }
        }  
            
    }
    
    public function near_by_user_post(){
        
        $Auth_Response = $this->auth_api2();
        if($Auth_Response==1){
            $data = $this->db->query("select * from users")->result_array();
        }else{
            $data = $this->db->query("select * from users where u_id !='".$Auth_Response['u_id']."'")->result_array();
        }
        
        if($data){
            $this->response(['status' => TRUE, 'message' => "Near By users","data" =>$data], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => TRUE, 'message' => "No Record Found","data" =>""], REST_Controller::HTTP_OK);
        }
        
    }
    
    
    public function all_notifications_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        $record = array();
        $data = $this->db->query("select * from notifications where noti_recvr_id ='".$Auth_Response['u_id']."'")->result_array();
        
        foreach($data as $key=>$value){
            
            $date = $this->check->timeAgo(strtotime($value['noti_date']));
            
            $time = array("noti_date"=>$date);
            $record[] = array_merge($value,$time);
        }
        
        if($record){
            $this->response(['status' => TRUE, 'message' => "All Notifications","data" =>$record], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record Found","data" =>""], REST_Controller::HTTP_OK);
        }
    }
    
    public function MyAllMsgs_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $record = array();
        
        $u_id = $Auth_Response['u_id'];
        
        if(!empty($u_id)){
            
            $sql = "select msgs.*,users.dp,f_name,l_name from msgs left 
                  join users on 
                    case 
                    when(recv_id = $u_id) then(users.u_id = send_id)
                    when(send_id = $u_id) then(users.u_id = recv_id)
                    end   
                  where msg_id IN(
                    select MAX(msg_id) from msgs where send_id='$u_id' or recv_id='$u_id'
                    group by
                      case
                        when(send_id = $u_id) then(recv_id)
                        when(recv_id = $u_id) then(send_id)
                      end  
                    ) order by msg_id desc";
                    
            $data = $this->db->query($sql)->result_array();
           
            foreach($data as $key=>$value){
            
                $date = $this->check->timeAgo(strtotime($value['date']));
                
                $time = array("time"=>$date);
                $record[] = array_merge($value,$time);
            }
           
            if(!empty($record)){
               
               $this->response(["status" => TRUE, 'message' => "All Msgs.",'data'=>$data], REST_Controller::HTTP_OK);
            }else{
                $this->response(["status" => FALSE, 'message' => "No Data found.",'data'=>''], REST_Controller::HTTP_OK);
            }
          
            
        }else{
             $this->response(["status" => FALSE, 'message' => "No Data found.",'data'=>''], REST_Controller::HTTP_OK);
        }
        

    }
    
    public function addchallenge_post(){
        
        $Auth_Response = $this->auth_api();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $chlngname = $this->input->post("challengename");
        $privacy = $this->input->post("privacy");
        $type = $this->input->post("type");
        $location = $this->input->post("location");
        $category = $this->input->post("category");
        $chlng_lati = $this->input->post("chlng_lati");
        $chlng_longi = $this->input->post("chlng_longi");
        $user_specific_id = $this->input->post("u_id");
        
        if(empty($this->input->post("challenge_id"))){
            $challenge_id = 0;
        }else{
            $challenge_id = $this->input->post("challenge_id");
        }
        
        
        //echo "<pre>";var_dump($_FILES); exit;
        
        if($_FILES['files']['size'] > 0){  
            $directory = 'uploads/';
            $alowedtype = "*";
            $results = $this->uploadimage->singleuploadfile($directory,$alowedtype,"files");
            
            if(!empty($results[0]['file_name'])){
                
                $array = array(
                                "u_id"=>$Auth_Response['u_id'],
                                "challengename"=>$chlngname,
                                "privacy"=>$privacy,
                                "type"=>$type,
                                "location"=>$location,
                                "chlng_lati"=>$chlng_lati,
                                "chlng_longi"=>$chlng_longi,
                                "category"=>$category,
                                "response_of"=>$challenge_id,
                                "post_date"=>date("Y-m-d H:i:s"),
                                "file"=>"uploads/".$results[0]['file_name'],
                                "user_specific_id"=>$user_specific_id,
                              );
                              
                $query = $this->Common->insert("challenges",$array);
                
                if($query){
                    $this->response(['status' => TRUE, 'message' => "Challenge posted","data" =>""], REST_Controller::HTTP_OK);
                }else{
                    $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
                }
                
            }else{
                $this->response(['status' => FALSE, 'message' => "Something went wrong. Please try again later.","data" =>""], REST_Controller::HTTP_OK);
            }
        }else{
            $this->response(['status' => FALSE, 'message' => "File is missing.","data" =>""], REST_Controller::HTTP_OK);
        }    
            
    }
    
    public function allchallenge_post(){
        $record = array();

        $Auth_Response = $this->auth_api2();
        if($Auth_Response==1){
            
        }else if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }

        
        $type = $this->input->post("type"); //recent,challenges of the week
        
        if(!empty($this->input->post("challenge_id")) || !empty($this->input->post("challengename"))){
            if(!empty($this->input->post("challenge_id"))){
                $data = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where response_of='".$this->input->post("challenge_id")."'")->result_array();
            }else if(!empty($this->input->post("challengename"))){
                $data = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where challengename='".$this->input->post("challengename")."'")->result_array();
            }
            
        }else{
            $data = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id")->result_array();
        }
        
        if(!empty($data)){
            $i=0;
            foreach($data as $key=>$value){
                
                $ishide = $this->db->query("select * from hide_challenge where u_id='".$Auth_Response['u_id']."' and challenge_id='".$value['challenge_id']."'");
                if($ishide->num_rows() > 0){
                    continue;
                }
                
                $title = ucwords($value['f_name']." ".$value['l_name'])." has posted a challenge at ".$value['location'];
                $title = array("title"=>$title);
                $views = $this->db->query("select count(*) as count from challenge_views where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
                $claps = $this->db->query("select count(*) as count from claps where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
                $shares = $this->db->query("select count(*) as count from shares where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
                $downloads = $this->db->query("select count(*) as count from download_clap where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
                
                $post_date = $this->check->timeAgo(strtotime($value['post_date']));
                $post_date = array("post_date"=>$post_date);
                
                $away = $this->check->distance($value['lati'],$value['longi'],$value['chlng_lati'],$value['chlng_longi'],"K");
                
                $away = array("away"=>intval($away)." km away");
                $claps = array("claps"=>$claps);
                $views = array("views"=>$views);
                $shares = array("shares"=>$shares);
                $played = array("downloads"=>$downloads);
                
                $isclaped = $this->db->query("select * from claps where u_id='".$Auth_Response['u_id']."' and challenge_id='".$value['challenge_id']."'");
                if($isclaped->num_rows() > 0){
                    $is_claped = array("liked"=>true);
                }else{
                    $is_claped = array("liked"=>false);
                }
                
                
                if($i==0){
                    $paused = array("paused"=>false); 
                }else{
                    $paused = array("paused"=>true);
                }
                
                if(!empty($this->input->post("my_challenge")) || !empty($this->input->post("challenge_id"))){
                    $value['response_of']=1;
                    $show_back_btn = array("show_back_btn"=>true); 
                }else{
                    $show_back_btn = array("show_back_btn"=>false); 
                }
                
                
                
                $record[] = array_merge($value,$title,$post_date,$away,$claps,$views,$shares,$played,$paused,$is_claped,$show_back_btn);
                $i++;
            }
            
            if($record){
                $this->response(['status' => TRUE, 'message' => "Record found.","data" =>$record,"dp" =>$Auth_Response['dp']], REST_Controller::HTTP_OK);
            }else{
                $this->response(['status' => FALSE, 'message' => "File is missing.","data" =>""], REST_Controller::HTTP_OK);
            }
        
        }else{
            $this->response(['status' => FALSE, 'message' => "No Record Found.","data" =>""], REST_Controller::HTTP_OK);
        }
        
            
    }
    
    public function singlechallenge_post(){
        
        $Auth_Response = $this->auth_api2();
        if($Auth_Response==1){
            
        }else if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $record = array();

        $challenge_id = $this->input->post("challenge_id");
        
        $data = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where challenge_id='$challenge_id'")->result_array();
        
        $i=0;

        foreach($data as $key=>$value){
            
            $title = ucwords($value['f_name']." ".$value['l_name'])." has posted a challenge at ".$value['location'];
            $title = array("title"=>$title);
            $views = $this->db->query("select count(*) as count from challenge_views where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            $claps = $this->db->query("select count(*) as count from claps where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            $shares = $this->db->query("select count(*) as count from shares where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            $downloads = $this->db->query("select count(*) as count from download_clap where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            
            $post_date = $this->check->timeAgo(strtotime($value['post_date']));
            $post_date = array("post_date"=>$post_date);
            
            $away = $this->check->distance($value['lati'],$value['longi'],$value['chlng_lati'],$value['chlng_longi'],"K");
            
            $away = array("away"=>intval($away)." km away");
            $claps = array("claps"=>$claps);
            $views = array("views"=>$views);
            $shares = array("shares"=>$shares);
            $played = array("downloads"=>$downloads);
            $is_claped = array("liked"=>false);
            
            if($i==0){
                $paused = array("paused"=>false); 
            }else{
                $paused = array("paused"=>true);
            }
            
            
            $record[] = array_merge($value,$title,$post_date,$away,$claps,$views,$shares,$played,$paused,$is_claped);
            $i++;
        }
        
        $responses = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where response_of='$challenge_id'")->result_array();
        
        
        if($record){
            $this->response(['status' => TRUE, 'message' => "Record found.","data" =>$record,"responses" =>$responses], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "File is missing.","data" =>""], REST_Controller::HTTP_OK);
        }
        
    }
    
    public function open_notification_post(){
        
        $Auth_Response = $this->auth_api();
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $record = array();

        $noti_id = $this->input->post("noti_id");
        $this->db->query("update notifications set is_read='Yes' where noti_id='$noti_id'");
        
        $challenge_id = $this->db->query("select * from notifications where noti_id='$noti_id'")->result_array()[0]['challenge_id'];
        
        $data = $this->db->query("select challenges.*,users.* from challenges inner join users on users.u_id=challenges.u_id where challenge_id='$challenge_id'")->result_array();
        
        $i=0;

        foreach($data as $key=>$value){
            
            $title = ucwords($value['f_name']." ".$value['l_name'])." has posted a challenge at ".$value['location'];
            $title = array("title"=>$title);
            $views = $this->db->query("select count(*) as count from challenge_views where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            $claps = $this->db->query("select count(*) as count from claps where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            $shares = $this->db->query("select count(*) as count from shares where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            $downloads = $this->db->query("select count(*) as count from download_clap where challenge_id='".$value['challenge_id']."'")->result_array()[0]['count'];
            
            $post_date = $this->check->timeAgo(strtotime($value['post_date']));
            $post_date = array("post_date"=>$post_date);
            
            $away = $this->check->distance($value['lati'],$value['longi'],$value['chlng_lati'],$value['chlng_longi'],"K");
            
            $away = array("away"=>intval($away)." km away");
            $claps = array("claps"=>$claps);
            $views = array("views"=>$views);
            $shares = array("shares"=>$shares);
            $played = array("downloads"=>$downloads);
            $is_claped = array("liked"=>false);
            
            if($i==0){
                $paused = array("paused"=>false); 
            }else{
                $paused = array("paused"=>true);
            }
            
            $record[] = array_merge($value,$title,$post_date,$away,$claps,$views,$shares,$played,$paused,$is_claped);
            $i++;
        }
        
        
        if($record){
            $this->response(['status' => TRUE, 'message' => "Record found.","data" =>$record,"responses" =>$responses], REST_Controller::HTTP_OK);
        }else{
            $this->response(['status' => FALSE, 'message' => "File is missing.","data" =>""], REST_Controller::HTTP_OK);
        }
        
    }
    
    public function clap_challenge_post(){
        
        $Auth_Response = $this->auth_api();
        $record = array();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $challenge_id = $this->input->post("challenge_id");
        
        $clap_query = $this->db->query("select * from claps where u_id='".$Auth_Response['u_id']."' and challenge_id='$challenge_id'");
        
        
        $token = $this->db->query("select * from users where u_id='1'")->result_array()[0]['token'];
        $title="Clap";
       // $notification = "helo this is a test";
        
      //  $this->sendNotification_post($title,$notification,$token); 
      //  $this->response(['status' => TRUE, 'message' => "Record deleted.","data" =>""], REST_Controller::HTTP_OK);
        
         if($clap_query->num_rows() > 0){
            $this->db->query("delete from claps where u_id='".$Auth_Response['u_id']."' and challenge_id='$challenge_id'");
            
             $lst_claper = $this->db->query("select users.* from claps inner join users on users.u_id=claps.u_id where challenge_id='$challenge_id' order by clap_id desc limit 1")->result_array()[0];
             $sendername = ucwords($lst_claper['f_name']." ".$lst_claper['l_name']);
             
             //print_r($lst_claper);
            if(count($lst_claper) == 1){
                 $clap_query = $this->db->query("select * from claps where challenge_id='$challenge_id'");
                 $totalclaps = $clap_query->num_rows();
                 if($totalclaps>1){
                     $totalclaps -= 1;
                     $notification = $sendername." and $totalclaps other has clapped on your challenge";
                 }else{
                     $notification = $sendername."has clapped on your challenge";
                 }
                
                
                 $noti_id = $this->db->query("select * from notifications where challenge_id='$challenge_id' and not_status='clap'")->result_array()[0]['noti_id'];
                 $array = array(
                                 "notification"=>$notification,
                             );
                
                 $con['conditions'] = array("noti_id"=>$noti_id);    
                 $this->Common->update("notifications",$array,$con);
    
                 $this->response(['status' => TRUE, 'message' => "Record deleted.","data" =>""], REST_Controller::HTTP_OK);
            }else{
                $this->db->query("delete from notifications where noti_sender_id='".$Auth_Response['u_id']."' and challenge_id='$challenge_id'");
                $this->response(['status' => TRUE, 'message' => "Record deleted.","data" =>""], REST_Controller::HTTP_OK);
            }
         }else{
            
             $array = array(
                             "u_id"=>$Auth_Response['u_id'],
                             "challenge_id"=>$challenge_id,
                           );
            
             $query = $this->Common->insert("claps",$array); 

             $noti_recvr_id = $this->db->query("select * from challenges where challenge_id='$challenge_id'")->result_array()[0]['u_id'];
            
             $getname = $this->db->query("select * from users where u_id='".$Auth_Response['u_id']."'")->result_array()[0];
             $sendername = ucwords($getname['f_name']." ".$getname['l_name']);
             
             /// notification send on clap
             $clap_query = $this->db->query("select * from claps where challenge_id='$challenge_id'");
             $totalclaps = $clap_query->num_rows();
             
             if($totalclaps>1){
                 $totalclaps -= 1;
                 $notification = $sendername." and $totalclaps other has clapped on your challenge";
             }else{
                 $notification = $sendername."has clapped on your challenge";
             }
              $this->sendNotification_post($title,$notification,$token); 
             //// end of notification
             
            
              
             $array = array(
                             "notification"=>$notification,
                             "noti_date"=>date("Y-m-d H:i:s"),
                             "noti_recvr_id"=>$noti_recvr_id,
                             "noti_sender_id"=>$Auth_Response['u_id'],
                             "not_status"=>"clap",
                             "challenge_id"=>$challenge_id,
                           );
            
             $query = $this->Common->insert("notifications",$array);
            
             if($query){
                 $this->response(['status' => TRUE, 'message' => "Record inserted.".$notification,"data" =>""], REST_Controller::HTTP_OK);
             }else{
                  $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
             }
                          
         }
            
    }
    
    public function sendNotification_post($title,$body,$token){

        $url = "https://fcm.googleapis.com/fcm/send";
        
        $serverKey = 'AAAAzJ2Q1Xo:APA91bHAHmNLXKj04FVTjzE7PjZ6LzhWwqvSaq_yD_sPeNAKvZQicXSXc7KfL3fIa_ZLjsTV7JLNoS_YlXqmwwIZOKvKWfbZQcyVtV32tg7oMGgojLE2AdsmG2VKB1joD3v-nS8v4wKr';
        
        $notification = array('title' =>$title , 'body' => $body, 'sound' => 'noti.mp3', 'badge' => '1');
        $data['clap'] = 'yes';
        
        $arrayToSend = array('to' => $token, 'notification' => $notification,'priority'=>'high','data'=>$data);
        $json = json_encode($arrayToSend);
        //$data = json_encode(array('clap'=>'yes'));
        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Authorization: key='. $serverKey;
        $ch = curl_init();
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        
        //Send the request
        $response = curl_exec($ch);
        //Close request
        if ($response === FALSE) {
        die('FCM Send Error: ' . curl_error($ch));
        }
       
        curl_close($ch);
        
    }
    
    
    public function addplaylistname_post(){
        
        $Auth_Response = $this->auth_api();
        $record = array();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $name = $this->input->post("name");

        $array = array(
                        "u_id"=>$Auth_Response['u_id'],
                        "playlist_name"=>$name,
                      );
        
        $query = $this->Common->insert("playlist_names",$array); 
        
        
        if($query){
            $allplaylist = $this->db->query("select * from playlist_names where u_id='".$Auth_Response['u_id']."'")->result_array();
            
            $this->response(['status' => TRUE, 'message' => "Record inserted.","data" =>$allplaylist], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
        }
                   
            
    }
    
    public function share_challenge_post(){

        $challenge_id = $this->input->post("challenge_id");
        
        $array = array(
                        "challenge_id"=>$challenge_id,
                      );
        
        $query = $this->Common->insert("shares",$array);  
        
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record inserted.","data" =>""], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
        }
                 
            
    }
    
    public function add_challenge_to_playlist_post(){
        
        $Auth_Response = $this->auth_api();
        $record = array();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $challenge_id = $this->input->post("challenge_id");
        $playlist_id = $this->input->post("playlist_id");
        
        //echo "<pre>";var_dump($playlist_id); exit;
        
        foreach($playlist_id as $key=>$value){
            
            $array = array(
                        "u_id"=>$Auth_Response['u_id'],
                        "playlist_id"=>$value,
                        "challenge_id"=>$challenge_id,
                      );
        
            $query = $this->Common->insert("playlist",$array);
        
        }
          
        
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record inserted.","data" =>""], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
        }
                 
            
    }
    
    public function report_challange_post(){
        
        $Auth_Response = $this->auth_api();
        $record = array();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $challenge_id = $this->input->post("challlange_id");
        $reasons = $this->input->post("reasons");
        $note = $this->input->post("note");
        
        
        foreach($reasons as $key=>$value){
            
            $array = array(
                        "challenge_id"=>$challenge_id,
                        "note"=>$note,
                        "reasons"=>$value,
                        "u_id"=>$Auth_Response['u_id'],
                        
                      );
        
            $query = $this->Common->insert("reports_challenge",$array);
        
        }
          
        
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record inserted.","data" =>""], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
        }
                 
            
    }
    
    
    public function download_challenge_post(){
        
        $record = array();
        $challenge_id = $this->input->post("challenge_id");
        
        $array = array(
                        "challenge_id"=>$challenge_id,
                      );
        
        $query = $this->Common->insert("download_clap",$array);  
        
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record inserted.","data" =>""], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
        }
                 
            
    }
    
    
    public function hide_challenge_post(){
        
        $Auth_Response = $this->auth_api();
        $record = array();
       
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $challenge_id = $this->input->post("challenge_id");
        
        $array = array(
                        "u_id"=>$Auth_Response['u_id'],
                        "challenge_id"=>$challenge_id,
                      );
        
        $query = $this->Common->insert("hide_challenge",$array);  
        
        if($query){
            $this->response(['status' => TRUE, 'message' => "Record inserted.","data" =>""], REST_Controller::HTTP_OK);
        }else{
             $this->response(['status' => FALSE, 'message' => "Something went wrong.","data" =>""], REST_Controller::HTTP_OK);
        }
                 
            
    }
    
     public function SendMsg_post(){
         
        $Auth_Response = $this->auth_api();
   
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
            
         
        //$u_id = $this->input->post("u_id");
        $u_id=$Auth_Response['u_id'];
        $recver_id = $this->input->post("recv_id");
        $content = $this->input->post("content");
        
        if(!empty($u_id)||!empty($recver_id)){
            $array = array(
                            "recv_id"=>$recver_id,
                            "send_id"=>$u_id,
                            "content"=>$content,
                            "date"=>date("Y-m-d H:i:s"),
                          );
            $lastid = $this->Common->insert("msgs",$array);    
            if($lastid){
                $con['conditions']=array("msg_id"=>$lastid);
                $data = $this->Common->get_single_row("msgs",$con);
                $this->response(["status" => TRUE, 'message' => "Msg Sent.",'data'=>$data], REST_Controller::HTTP_OK);
            }
        }else{
             $this->response(["status" => FALSE, 'message' => "No Data found.",'data'=>''], REST_Controller::HTTP_OK);
        }
        

    }

    public function Convo_post(){
        
        $Auth_Response = $this->auth_api();
   
        if($Auth_Response==FALSE){
            $this->response(["status" => FALSE, 'message' => "Authorization Failed.","data" =>""], REST_Controller::HTTP_OK);
        }
        
        $u_id=$Auth_Response['u_id'];
        $recver_id = $this->input->post("recv_id");
        
        $otheruser = $this->db->query("select * from users where u_id='$recver_id'")->result_array()[0];
        $otheruser = ucwords($otheruser['fname']);
        
        if(!empty($u_id)||!empty($recver_id)){   
                
            $data = $this->db->query("select msgs.*,users.dp from msgs inner join users on u_id=send_id where recv_id='$u_id' and send_id='$recver_id'
                                      union
                                      select msgs.*,users.dp from msgs inner join users on u_id=recv_id where recv_id='$recver_id' and send_id='$u_id' order by date asc
                                      ")->result_array();
           
            $this->response(["status" => TRUE, 'message' => "All Msgs.",'data'=>$data], REST_Controller::HTTP_OK);
            
        }else{
             $this->response(["status" => FALSE, 'message' => "No Data found.",'data'=>''], REST_Controller::HTTP_OK);
        }
        
    }
    
    public function forhce_post(){
        //var_dump($_SERVER);
        
        $myfile = fopen("newfile.txt", "r") or die("Unable to open file!");
        echo $data=fread($myfile,filesize("newfile.txt"));
        //$this->response(['status' => true, 'message' => "HCE data","data" =>$data], REST_Controller::HTTP_OK);
        //fclose($myfile);

    }
    
}