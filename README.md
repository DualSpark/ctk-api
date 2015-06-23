CTK-API Cookbook
=================
This cookbook deploys the individual services that make up the DualSpark Cutthroat Kitchen Microservice API platform.

Requirements
------------

#### cookbooks
- `build-essential` - Installs C compiler / build tools
- `supervisor` - Installs supervisor and provides resources to configure services
- `python` - Installs Python, pip and virtualenv. Includes LWRPs for managing Python packages with `pip` and `virtualenv` isolated Python environments.

Attributes
----------

#### ctk-api::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apt']['compile_time_update']</tt></td>
    <td>Boolean</td>
    <td>force the default recipe to run <tt>apt-get update</tt> at compile time</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['build-essential']['compile_time']</tt></td>
    <td>Boolean</td>
    <td>Execute resources at compile time</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['python']['install_method']</tt></td>
    <td>String</td>
    <td>method to install python with</td>
    <td><tt>package</tt></td>
  </tr>
  <tr>
    <td><tt>['python']['version']</tt></td>
    <td>String</td>
    <td>the version of the package to install/upgrade. If no version is given latest is assumed.</td>
    <td><tt>2.7.10</tt></td>
  </tr>
  <tr>
    <td><tt>['python']['checksum']</tt></td>
    <td>String</td>
    <td>sha256 checksum for source package of python install if/when installed from source.</td>
    <td><tt>eda8ce6eec03e74991abb5384170e7c65fcd7522e409b8e83d7e6372add0f12a</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['package_name']</tt></td>
    <td>String</td>
    <td>Name of the python package to install/td>
    <td><tt>ctk-episode-api</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['package_version']</tt></td>
    <td>String</td>
    <td>Version of the python package to install</td>
    <td><tt>0.1.0</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['package_location']</tt></td>
    <td>String</td>
    <td>Package location template for downlodaing and installing python package from URL</td>
    <td><tt>https://s3-us-west-2.amazonaws.com/packages.dualspark.com/dev/ctk-api-episode/#{node['ctk-api']['package_name']}-#{node['ctk-api']['package_version']}.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['name']</tt></td>
    <td>String</td>
    <td>Name of this API</td>
    <td><tt>episode</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['single_uri_base']</tt></td>
    <td>String</td>
    <td>Base uri from which this API is hosted</td>
    <td><tt>/#{node['ctk-api']['name']}</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['list_uri_base']</tt></td>
    <td>String</td>
    <td>Base uri for list actions and post for creating new objects</td>
    <td><tt>/#{node['ctk-api']['name']}s</tt></td>
  </tr>
  <tr>
    <td><tt>['ctk-api']['healthcheck_base']</tt></td>
    <td>String</td>
    <td>Uri for the health check action for this api</td>
    <td><tt>/healthcheck</tt></td>
  </tr>
</table>

Usage
-----
#### ctk-api::default

Just include `ctk-api` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ctk-api]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:
* Patrick McClory <patrick@dualspark.com>
