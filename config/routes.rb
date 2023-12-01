Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  post("/insert_user", { :controller => "users", :action => "create"})
  get("/users/:a_username", { :controller => "users", :action => "show"})
  post("/update_user/:user_id", { :controller => "users", :action => "update"})

  get("/photos", { :controller => "photos", :action => "index"})
  post("/insert_photo", { :controller => "photos", :action => "create"})
  get("/photos/:photo_id", { :controller => "photos", :action => "show"})
  post("/update_photo/:photo_id", { :controller => "photos", :action => "update"})
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "destroy"})

  post("/insert_comment", {:controller => "comments", :action => "create"})

end
