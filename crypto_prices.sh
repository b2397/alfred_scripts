#!/bin/bash
export PATH=/usr/local/bin:$PATH

vALL=$(curl -s "https://api.coinmarketcap.com/v1/ticker/?limit=100/")
vBTC=$(echo $vALL | jq --raw-output 'map(select(.id == "bitcoin")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vETH=$(echo $vALL | jq --raw-output 'map(select(.id == "ethereum")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vLTC=$(echo $vALL | jq --raw-output 'map(select(.id == "litecoin")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vXRP=$(echo $vALL | jq --raw-output 'map(select(.id == "ripple")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vXLM=$(echo $vALL | jq --raw-output 'map(select(.id == "stellar")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vNEO=$(echo $vALL | jq --raw-output 'map(select(.id == "neo")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vOMG=$(echo $vALL | jq --raw-output 'map(select(.id == "omisego")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')
vNANO=$(echo $vALL | jq --raw-output 'map(select(.id == "nano")) | .[].price_usd' | awk '{ printf "%.2f\n", $1 }')

cat << EOB
{"items": [

    {
        "subtitle": "Bitcoin",
        "title": "\$${vBTC}",
        "icon": {
            "path": "bitcoin.png"
        }
    },

    {
        "subtitle": "Ethereum",
        "title": "\$${vETH}",
        "icon": {
            "path": "ethereum.png"
        }
    },
  
  {
        "subtitle": "Litecoin",
        "title": "\$${vLTC}",
        "icon": {
            "path": "litecoin.png"
        }
    },

    {
        "subtitle": "Ripple",
        "title": "\$${vXRP}",
        "icon": {
            "path": "ripple.png"
        }
    },
  
    {
        "subtitle": "Stellar",
        "title": "\$${vXLM}",
        "icon": {
            "path": "stellar.png"
        }
    },
  
    {
        "subtitle": "NEO",
        "title": "\$${vNEO}",
        "icon": {
            "path": "neo.png"
        }
    },

    {
        "subtitle": "OmiseGo",
        "title": "\$${vOMG}",
        "icon": {
            "path": "omg.png"
        }
    },
  
    {
        "subtitle": "Nano",
        "title": "\$${vNANO}",
        "icon": {
            "path": "nano.png"
        }
    }

]}
EOB
