  &#xa0;

  <!-- <a href="https://letsencryptcloudflaresetup.netlify.app">Demo</a> -->
</div>

<h1 align="center">Letsencrypt Cloudflare Setup</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8">

  <!-- <img alt="Github issues" src="https://img.shields.io/github/issues/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8" /> -->

  <!-- <img alt="Github forks" src="https://img.shields.io/github/forks/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8" /> -->

  <!-- <img alt="Github stars" src="https://img.shields.io/github/stars/JershBytes/letsencrypt-cloudflare-setup?color=56BEB8" /> -->
</p>

<!-- Status -->

<!-- <h4 align="center"> 
	🚧  Letsencrypt Cloudflare Setup 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0;  &#xa0;
</p>

<br>

## :dart: About ##

I've created this little series of scripts to help automate how I spin up my [let's encrypt](https://letsencrypt.org/) certs.

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com) installed.

## :checkered_flag: Starting ##

```bash
# Clone this project
$ git clone https://github.com/JershBytes/letsencrypt-cloudflare-setup

# Access
$ cd letsencrypt-cloudflare-setup

# Install dependencies
$ ./certbot_installer.sh

# Modify the le.env file
# Modify the contents to what yours chould be.

# Run the project
$ ./cert.sh (onlycert | cockpit)  # To create your certs
```

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/JershBytes" target="_blank">Joshua Ross</a>

&#xa0;

<a href="#top">Back to top</a>
