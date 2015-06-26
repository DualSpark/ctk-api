require 'serverspec'

set :backend, :exec

describe "Updated to latest", :if => os[:family] == 'ubuntu' do
    describe file ('/var/lib/apt/periodic/update-success-stamp') do
        it { should be_file }
    end
end

describe "API Logs" do

    describe file ('/var/log/ctk-api.stderr.log') do
        it { should be_file }
    end

    describe file('/var/log/ctk-api.stdout.log') do
        it { should be_file }
    end

end

describe "Services installed" do

    describe package('python'), :if => ['debian', 'rhel', 'fedora', 'freebsd', 'default'].include?(os[:family]) do
        it { should be_installed }
    end

    describe package('python-dev'), :if => ['debian', 'default'].include?(os[:family]) do
        it { should be_installed }
    end

    describe package('python-devel'), :if => ['rhel', 'fedora'].include?(os[:family]) do
        it { should be_installed }
    end

    describe package('python27'), :if => os[:family] == 'smartos' do
        it { should be_installed }
    end

    describe package('supervisor') do
        it { should be_installed.by('pip') }
    end

    describe package('ctk-api-episode') do
        it { should be_installed.by('pip') }
    end

end
