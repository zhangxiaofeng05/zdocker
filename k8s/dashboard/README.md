github: https://github.com/kubernetes/dashboard

1. 通过helm安装  
https://github.com/kubernetes/dashboard?tab=readme-ov-file#installation  
2. 创建简单用户    
https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md  
```
# apply
kubectl apply -f dashboard-adminuser.yaml

# 创建token
kubectl -n kubernetes-dashboard create token admin-user
```
3. 端口转发  
```
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```
4. 访问 https://localhost:8443  

