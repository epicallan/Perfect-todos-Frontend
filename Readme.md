## Deployment

```
docker build --build-arg REACT_APP_BACKEND_URL=http://0.0.0.0:3000 -t todo-app .

docker run -d -p 3001:3001 todo-app
```
