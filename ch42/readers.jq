select(.objectRef.resource == "secrets" and .objectRef.namespace == "kubebook-ch42-audit" and (.verb == "get" or .verb == "list" or .verb == "watch") and .responseStatus.code == 200) | .user.username
