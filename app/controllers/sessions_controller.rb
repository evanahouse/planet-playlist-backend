class SessionsController < ApplicationController
end

# 
# 1. Create User - Sign Up
#   validate username, validate password
#   Bcrypt salts/hases password
#   stored in database
#   frontend --> redirect to login
# 
# 2. frontent form has username/password
#   send POST {user: {username: x, password: x}}
#   to route /sessions

# 3. frontend recieve user info/ jwt token
#   save token to local storage
#   the user has the token -its id- for the remainder of the session
#   log out - delete token from the local storage

# 4. Token Permissions
#   Make restful requests - with token in header
#    This is where we auth our jwt token’