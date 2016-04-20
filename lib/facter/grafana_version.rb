if  FileTest.exists?("/usr/bin/dpkg-query")
	if system("/usr/bin/dpkg -l | grep -q grafana")
		Facter.add("grafana_version") do
			setcode do
				%x{/usr/bin/dpkg-query -W -f='${Version}' grafana}
			end
		end
	end
end
