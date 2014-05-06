# Need to add api.smartfridge.com to /etc/hosts file 
# for these helpers to work correctly
def api_get action, params={}
  request.host = "api.smartfridge.com"
  get "/#{action}", params
  JSON.parse(response.body) rescue {}
end

def api_post action, params={}
  request.host = "api.smartfridge.com"
  post "/#{action}", params
  JSON.parse(response.body) rescue {}
end

def api_delete action, params={}
  request.host = "api.smartfridge.com"
  delete "/#{action}", params
  JSON.parse(response.body) rescue {}
end

def api_put action, params={}
  request.host = "api.smartfridge.com"
  put "/#{action}", params
  JSON.parse(response.body) rescue {}
end