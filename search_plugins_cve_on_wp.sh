#!/bin/bash

echo "🔍 Buscador de CVEs de plugins WordPress (sem API key)"
read -p "🧩 Nome do plugin (ex: contact-form-7): " plugin
read -p "📦 Versão (opcional, pressione Enter para ignorar): " versao

# Substitui hífen por espaço para facilitar busca textual
plugin_search=$(echo "$plugin" | sed 's/-/ /g')

echo -e "\n🔗 Acesse os links abaixo para verificar CVEs conhecidas:\n"

# NVD (National Vulnerability Database)
nvd_url="https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&query=${plugin_search// /+}"
echo "🌐 NVD: $nvd_url"

# CVE.org
cve_org_url="https://www.cve.org/SearchResults?q=${plugin_search// /+}"
echo "🌐 CVE.org: $cve_org_url"

# WPScan
wpscan_url="https://wpscan.com/plugin/$plugin"
echo "🌐 WPScan (plugin específico): $wpscan_url"

# ExploitDB (busca manual com curl)
exploitdb_url="https://www.exploit-db.com/search?cve=&q=$plugin"
echo "🌐 ExploitDB: $exploitdb_url"

if [ ! -z "$versao" ]; then
    echo -e "\n⚠️ Dica: dentro dos sites, busque pela versão '$versao' para saber se é vulnerável."
fi

echo -e "\n🔧 Dica: use Ctrl+Clique para abrir os links no terminal gráfico, ou copie e cole no navegador."
