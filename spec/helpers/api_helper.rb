# Need to add api.smartfridge.com to /etc/hosts file 
# for these helpers to work correctly
def api_get action, params={}
  get '/#{action}', params, subdomain: 'api'
  JSON.parse(response.body) rescue {}
end

def api_post action, params={}
  post '/#{action}', params, subdomain: 'api'
  JSON.parse(response.body) rescue {}
end

def api_delete action, params={}
  delete '/#{action}', params, subdomain: 'api'
  JSON.parse(response.body) rescue {}
end

def api_put action, params={}
  put '/#{action}', params, subdomain: 'api'
  JSON.parse(response.body) rescue {}
end