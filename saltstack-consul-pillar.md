# saltstack use consul store pillar

## configure consul

1. install consul
```bash
wget -c 'https://releases.hashicorp.com/consul/1.0.1/consul_1.0.1_linux_amd64.zip?_ga=2.71685591.517819656.1511778794-94825051.1510719065' -O consul.zip

unzip consul.zip
mv -v consul /usr/local/bin/
```

2. add consul conf
```bash
mkdir -pv /etc/consul.d
consul_master_uuid=$(uuidgen)
cat <<EOF >/etc/consul.d/master.json
{
  "acl_datacenter": "dc1",
  "acl_master_token": "${consul_master_uuid}",
  "acl_default_policy": "allow",
  "acl_down_policy": "extend-cache"
}
EOF
```

3. make agent token
```bash
curl \
    --request PUT \
    --header "X-Consul-Token: ${consul_master_uuid}" \
    --data \
    '{
    "Name": "Agent Token",
    "Type": "client",
    "Rules": "node \"\" { policy = \"write\" } service \"\" { policy = \"read\" }"
     }' http://127.0.0.1:8500/v1/acl/create
### output
{
  "ID": "4f9be252-ba62-aa1f-b0e4-0c6659ed715f"
}

consul_agent_token='4f9be252-ba62-aa1f-b0e4-0c6659ed715f'
use id token for agent token

cat <<EOF >/etc/consul.d/master.json
{
  "acl_datacenter": "dc1",
  "acl_master_token": "${consul_master_uuid}",
  "acl_default_policy": "allow",
  "acl_down_policy": "extend-cache",
  "acl_agent_token": "${consul_agent_token}"
}
```

