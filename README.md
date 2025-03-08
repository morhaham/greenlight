## Current chapter - Creating the TokenModel and Validation Checks

## create user: 
` BODY='{"name": "Bob Jones", "email": "john22@dddexamplee.com", "password": "pa55word"}' `
`curl -d "$BODY" localhost:4004/v1/users`

## activate user
`curl -X PUT -d '{"token": "ZFIX3YS2E2AAJD5XFQEKOTPMQA"}' localhost:4004/v1/users/activated`

## authentication
`curl -i -d '{"email": "john22@dddexamplee.com", "password": "pa55word"}' localhost:4004/v1/users/authentication`
}
## request with bearer token
`curl -H "Authorization: Bearer SZ3ZKPFYJDCYWDWU2NYVKZN6UQ" localhost:4004/v1/healthcheck`
