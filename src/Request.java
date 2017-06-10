

public class Request {
 
 Integer request_id;

 Integer user_id;
  String comments;
  String request_dt; 
  String request_status;
  Integer hours_requested ;
  String start_dt ;
  String end_dt ;
  Integer updated_by ;
  String updated_dt;
 
  public Request(Integer request_id, Integer user_id, String comments, String request_dt, String request_status,
    Integer hours_requested, String start_dt, String end_dt, Integer updated_by, String updated_dt) {
   super();
   this.request_id = request_id;
   this.user_id = user_id;
   this.comments = comments;
   this.request_dt = request_dt;
   this.request_status = request_status;
   this.hours_requested = hours_requested;
   this.start_dt = start_dt;
   this.end_dt = end_dt;
   this.updated_by = updated_by;
   this.updated_dt = updated_dt;
  }
  
 
 public Request() {
   super();
  }

 public Integer getRequest_id() {
  return request_id;
 }
 public void setRequest_id(Integer request_id) {
  this.request_id = request_id;
 }
 public Integer getUser_id() {
  return user_id;
 }
 public void setUser_id(Integer user_id) {
  this.user_id = user_id;
 }
 public String getComments() {
  return comments;
 }
 public void setComments(String comments) {
  this.comments = comments;
 }
 public String getRequest_dt() {
  return request_dt;
 }
 public void setRequest_dt(String request_dt) {
  this.request_dt = request_dt;
 }
 public String getRequest_status() {
  return request_status;
 }
 public void setRequest_status(String request_status) {
  this.request_status = request_status;
 }
 public Integer getHours_requested() {
  return hours_requested;
 }
 public void setHours_requested(Integer hours_requested) {
  this.hours_requested = hours_requested;
 }
 public String getStart_dt() {
  return start_dt;
 }
 public void setStart_dt(String start_dt) {
  this.start_dt = start_dt;
 }
 public String getEnd_dt() {
  return end_dt;
 }
 public void setEnd_dt(String end_dt) {
  this.end_dt = end_dt;
 }
 public Integer getUpdated_by() {
  return updated_by;
 }
 public void setUpdated_by(Integer updated_by) {
  this.updated_by = updated_by;
 }
 public String getUpdated_dt() {
  return updated_dt;
 }
 public void setUpdated_dt(String updated_dt) {
  this.updated_dt = updated_dt;
 }
 
 
 

}

