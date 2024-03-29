#!/usr/bin/perl

use warnings;
use strict;

# TODO: Review this list. Maybe use something better than extension?
my $supported_filetypes = {
  perl       => ['pl', 'pm'],
  html       => ['html', 'htm'],
  js         => [
	          'cjsx', 'js', 'vue', 'ts', 'dts',
		  'd.ts', 'tsx', 'jsx', 'coffee',
		  'es6', 'mjs', 'ejs'
	        ],
  c          => ['c', 'h'],
  cpp        => ['cpp', 'hpp', 'cc', 'ipp', 'hh', 'mm', 'c++'],
  java       => ['java'],
  css        => ['css', 'scss'],
  json       => ['json', 'cson', 'bson'],
  shell      => ['sh', 'bash', 'zsh'],
  php        => ['php', 'ctp', 'twig', 'phpt'],
  hask       => ['hs'],
  d          => ['d'],
  dart       => ['dart'],
  ps         => ['ps1', 'ps2'],
  lua        => ['lua'],
  sql        => ['slq'],
  nim        => ['nim'],
  scala      => ['scala', 'sc'],
  clojure    => ['cljs', 'clj', 'el'],
  swift      => ['swift'],
  batch      => ['bat'],
  s          => ['s'],
  rust       => ['rs'],
  text       => ['text', 'txt'],
  vimscript  => ['vim'],
  python     => ['py', 'exs'],
  markdown   => ['markdown', 'md'],
  xml        => ['xml', 'xsd', 'xlf', 'xaml'],
  html       => ['html', 'xhtml', 'xht', 'htm', 'phtml'],
  css        => ['css', 'scss', 'sass'],
  go         => ['go'],
  yaml       => ['yml', 'yaml'],
  toml       => ['toml'],
  json       => ['json'],
  ruby       => ['rb', 'erb', 'haml'],
  java       => ['java'],
  kotlin     => ['kt', 'kts'],
  csharp     => ['cs'],
  c          => ['c', 'h', 'headers'],
};

my @all_filetypes = map { @{$_} } values %$supported_filetypes;
@all_filetypes = map { '-name "*.' . $_ . '"' } @all_filetypes;

# TODO: Make this list autogenerated somehow?
my @repositories = (
  "A-Whiff-of-Steam",
  "A3M-for-CodeIgniter-2.0",
  "AADGraphPowerShell",
  "ABCNuke",
  "ADW.Theme-Template",
  "ALG",
  "ANE-Chartboost",
  "APE-Server-v2",
  "AWS-Glacier-SNS-PowerShell",
  "AndEngineTMXTiledMapExtension",
  "Android-Photo-Cropper",
  "AndroidJUnit4",
  "AndroidObjectRecognition",
  "AndroidPractice",
  "Animator5D",
  "Ansible-win_dsc",
  "ApkFuncCounter",
  "App-htmlcat",
  "App-revealup",
  "Arduino-IPv6Stack",
  "AssertEx",
  "Auto-Mortar",
  "AutoTag",
  "AutomationExample",
  "AzureKubernetes",
  "BDManager",
  "BTNotificationEnabler",
  "Baiduyun",
  "BatchEngine",
  "BestLocationProvider-Android",
  "Bloodhound",
  "Blue",
  "BoL",
  "BoL_Studio",
  "Books",
  "BuildDeploySupport",
  "Bulls-Eye",
  "CCPomelo",
  "CLProgressHUD",
  "CPAN-Meta",
  "CartBundle",
  "Cloud-Haskell-Game",
  "Cmsed",
  "Cocos2d-x-Asynchronous-Http-Request-Library",
  "CodeFlow",
  "CollectionViewPlayGround",
  "Construct",
  "CoordinatorLayoutSample",
  "Copy-Command",
  "Countandra",
  "Coveralls-iOS",
  "CuteLoadingLayoutGit",
  "D-GameVFS",
  "DAVID",
  "DCMTK",
  "DCPUToolchain",
  "DDMountainNotifier",
  "DOOGLE",
  "DQuick",
  "DZImageView",
  "Dart.RayTracerDemo",
  "DerelictAL",
  "DerelictFI",
  "DerelictLibui",
  "Dirk",
  "Dist-Milla",
  "DubSub",
  "Dvorm",
  "ECEN4003_FinalProject",
  "ETSummnor",
  "EasyJSB-for-cocos2dx",
  "EventStore-DevOps",
  "EziSocialDemo",
  "FastStack",
  "Fergulator-Android",
  "FirstDefenceGame",
  "Flask-Nicely",
  "FloatingHints",
  "FrodoC64",
  "GDeskTunes",
  "Gallery",
  "GenI",
  "Genbeta-Dev-Engine",
  "Glasses",
  "GodotSharp",
  "Guita",
  "Haskell-Server-Generic-Library",
  "Hello-LWF-UIKit",
  "HiJackInTheBox",
  "Homeland2_Map_Editor",
  "Human_Level_Control_through_Deep_Reinforcement_Learning",
  "ICFP2011",
  "IPythonQL",
  "IconColorChanger",
  "IdaHaskell",
  "ImageFilterForIOS",
  "IngewikkeldWrapperBundle",
  "JSONSerialization",
  "KDevelop-template",
  "LEAP-OSXGestureController",
  "LESS.mode",
  "Lacuna-Server-Open",
  "Linq-Dart",
  "LinuxNativeNotification",
  "ListenersDebugCommandBundle",
  "Lua-utils-for-Witcher-3",
  "M33-Linux",
  "MSI",
  "Mangos-One-scripts-old",
  "Mangos-Zero-scriptdev0-old",
  "Midori",
  "MovieClipX",
  "NUnit.Snippets",
  "Negroni-Example",
  "Net-OAuth2",
  "NimRL",
  "OMSSearch",
  "OX",
  "On-Premises-Release-Toolkit",
  "Open-DoVision",
  "Oxide1",
  "PSGSHELL",
  "PSMock",
  "PSPrivateGalleryWalkthrough",
  "PSate",
  "PathRefresh",
  "Perlbal",
  "PesterSpec",
  "PhoneGap-Android-HTML5-WebSocket",
  "PiAssist",
  "Pixelate",
  "Posh-VsVars",
  "PoshSensu",
  "PowerShell-Perfmon-TCP-to-Logstash",
  "PowerTasks",
  "PowerUp",
  "Powershell.Slack",
  "PowershellModules",
  "ProjectUpgradeUtility",
  "Protocol-ACME",
  "Rainicorn",
  "Rambola",
  "RaspberryPi-LTSP",
  "Reddit-Image-Scraper",
  "RepRapCloud",
  "RxGcm",
  "SHA3ImplementedInsideofaRARfile",
  "SIPHON-SIP-Client-that-actually-compiles",
  "SIREn",
  "SKMCLauncher",
  "SSHCore",
  "Scala-TwitterStreamer",
  "ScalaGoodies",
  "Scalabha",
  "Scene-Manager",
  "SearchParty",
  "SearchVisualizer",
  "Shaderkit",
  "Simple-Sparsehash",
  "SimpleCustomTabs",
  "SimpleMVP",
  "Sitecore-Mobile-Device-Detector",
  "Skipstone",
  "SkyFireEMU_420",
  "Snowflakes",
  "SoundCloud-Playlist-Sync",
  "Spink",
  "Stalker",
  "SublimeLinter-clang",
  "SwarmMSKit",
  "Tank-Auth---3rd-Party-Authentication-Project",
  "TeleBeyond",
  "TestableJS",
  "TextViewOverflowing",
  "TheodoRogerCmsBundle",
  "ToS-EnhancedCollection",
  "Tukui",
  "Tukui_Filger",
  "Tutorials",
  "TwilioIVR",
  "Uploadify",
  "Vim-for-Rails",
  "VimCom",
  "WP-Resolutions",
  "WaxPatch_X64",
  "WebAPI-DBIC",
  "Webkit",
  "WhiteStag",
  "Wordscript",
  "Wyphon",
  "YACassandraPDO",
  "YPlayer",
  "a-tour-of-go-in-haskell",
  "aarrr",
  "abbot",
  "acgsh",
  "aiorest",
  "akka-extras",
  "alfred2-ruby-framework",
  "also_validates",
  "android-CLog",
  "android_device_htc_mecha",
  "android_frameworks_base",
  "android_system_bluetooth",
  "angular2-rbi-dart",
  "angular_objectory_demo",
  "ansible_ec2_vpc_nat_asg",
  "apartment",
  "apc-8750",
  "apnserver",
  "app",
  "appdirs",
  "appengine-apns-gcm",
  "appstract",
  "ariane",
  "armhf-node-webkit",
  "aspnet-win-docker",
  "astrotime",
  "asus-switcheroo",
  "asynccluster",
  "asynctest",
  "atbr",
  "atig",
  "attiny-nRF24L01",
  "auroracoin-project",
  "awesomerc",
  "awesomerc-ierton",
  "aws-cfn-resource-bridge",
  "barometer",
  "battleship",
  "bitocular",
  "bittorrent",
  "blizkost",
  "blueprints-scala",
  "breakdancer",
  "bspl",
  "bucket-list-adapter",
  "budget-tracker-ui",
  "buildtool",
  "bullet-scala",
  "bulletin",
  "bumper",
  "bwu_polymer_routing",
  "bzip2-cuda",
  "c3nav-32c3",
  "cabal-uninstall",
  "cabrio",
  "cafebabe",
  "caffe-theano-conversion",
  "cakephp-composer",
  "cakephp_google_plugin",
  "capistrano-ash",
  "carrierwave-crop",
  "cascal",
  "cassandra-d",
  "catalystx-simplelogin",
  "catke-for-luvit",
  "ccg",
  "cep-bnw",
  "certdiff",
  "cf",
  "chipmunk7_demos",
  "cis-194",
  "cityhash",
  "cjdrs",
  "cli.rs",
  "cocos2dx_recipe",
  "coda2-modes",
  "codea-controllers",
  "codec-jvm",
  "codeschool-vim-theme",
  "codesearch-pre-github",
  "coffeescript-netbeans",
  "colony",
  "comiko",
  "commercedev",
  "comp_sci.rs",
  "compass-borderbox",
  "compile_msg",
  "compound-types",
  "concise_logging",
  "conda-opencv3",
  "conf2kube",
  "cordova-plugin-alljoyn",
  "cpangrep",
  "cplusplus-th",
  "craft_introvert",
  "craftimport",
  "cref",
  "csvutil",
  "d3js-haskell",
  "dQuery",
  "dart-playground",
  "dart-sass",
  "dart_api_client_examples",
  "dart_flex",
  "dart_regexp_tester",
  "dartlr",
  "dartstrap",
  "dartxjs",
  "darwinkit",
  "deadcode",
  "delivery",
  "devbox-choco",
  "dfterm3",
  "diorama-game",
  "disredis",
  "dist-zilla-plugin-git",
  "django-daguerre",
  "django-dbarray",
  "django-feedback",
  "django-jimmypage",
  "django-objectpermissions",
  "django-smartagent",
  "django-tastypie-mongoengine",
  "docker-ceph",
  "docker-dashing",
  "docker-havok",
  "docker-root-xhyve",
  "docker-sonar",
  "docker-spray-example",
  "docmac",
  "dot-files",
  "drake.dart",
  "dropbox-tools",
  "dscience",
  "dumbster",
  "dup",
  "dynvm",
  "edt",
  "eim",
  "elasticsearch-d",
  "em-dir-watcher",
  "endovena",
  "energy",
  "enumap",
  "eskka",
  "esp_mqtt_lcd",
  "faplayerplus",
  "fetchIO",
  "finagle-metrics",
  "fixme",
  "flask-admin-old",
  "flatbuffers",
  "free-vl",
  "freebsd-vagrant",
  "freeless",
  "frp_dart",
  "future-streams",
  "fuzzbunch_wrapper",
  "gamekeeper",
  "gelf-php",
  "gem-capistrano-wp",
  "gen_http",
  "gerar-php",
  "getsparks.org",
  "gfx",
  "ghci-in-a-new-dress",
  "ghcjs-websockets",
  "gir-1.2-gtk-3.4",
  "gisp",
  "git-deploy-s3",
  "git-grep-vim",
  "git-hooks",
  "git-runner",
  "git-tutorial",
  "gitlab-ci-bot",
  "go-errortree",
  "go-safe-browsing-api",
  "go-tarfs",
  "golang-webapp-guide",
  "golucy",
  "gong",
  "gradle-build-variant-example",
  "graphers",
  "graphite-stack-ansible-vagrant",
  "grouper",
  "grunt.vim",
  "gsoup",
  "gst-recipes",
  "gumbo-d",
  "gut",
  "h2o-sparkling",
  "hablog",
  "hammock",
  "harken",
  "haskell-scalable-server",
  "haskell_hadoop",
  "haxonite",
  "hellno",
  "heroku-buildpack-elm",
  "heroku-buildpack-hhvm",
  "heroku-buildpack-vendorbinaries",
  "hiddle",
  "hipchat-ps",
  "historical-redux2",
  "hobson",
  "hostsplitter",
  "hox",
  "hp-kernel-tenderloin",
  "hprose-nim",
  "hs-hdf5",
  "http-parser.d",
  "inline",
  "intentbuilder",
  "intravert-ug",
  "intrude",
  "irc_client",
  "irssi-bitlbee-facebook-rename",
  "irssi-growl",
  "ishmael",
  "jenkins-puppet-scripts",
  "jolicloud-desktop-environment",
  "jordan-kernel",
  "jsbeautify",
  "json-ld",
  "json-msg-pack",
  "jsonf",
  "jsonizer",
  "jsonx",
  "jsstyle",
  "knn",
  "kodivc",
  "kohana-cron",
  "l20n.rs",
  "language-cil",
  "led",
  "lerosi",
  "levgen-benchmarks",
  "libgateY",
  "libid3-ios",
  "libpynexmo",
  "libwit",
  "lightning-dart",
  "limix-backup",
  "littlesnail",
  "livemark.vim",
  "lost_dart",
  "love-console",
  "lua-mapreduce",
  "lua-resty-riak",
  "luajit-ffipp",
  "luatexts",
  "luxor",
  "mache",
  "mako",
  "mamona",
  "marauder",
  "matrix",
  "mechanist",
  "mega-shield",
  "mesosaurus",
  "minify-cakephp",
  "minimize",
  "minimum-awesome",
  "mirosubs",
  "moai-based-pacman",
  "moaigui",
  "mod-ruid2",
  "mod_usdt",
  "model_concepts",
  "mojowka",
  "mongo",
  "mongo-d-driver",
  "mongoid-mapreduce",
  "mongomvcc",
  "moves",
  "movie-board",
  "moxy",
  "mpdnsd-perl",
  "nalloc",
  "netd",
  "networkUtilities",
  "nfqfilter",
  "nginx.vim",
  "nice-and-clean-theme",
  "niceconf",
  "nim-advent-of-code-2015",
  "nim-gmp",
  "nim-kvs-server",
  "nim-msp430",
  "nim-uuid",
  "nimCL",
  "nim_project_maker",
  "nima",
  "nimbot",
  "nimfmt",
  "nimlock",
  "nimna",
  "nimrod-tools",
  "nix-repl",
  "nnpack.torch",
  "node-docker-ci",
  "node-ogl",
  "node-sigar",
  "node-telldus",
  "node-webkit.dart",
  "node_io.dart",
  "notify-io",
  "ns2lua",
  "ocaml-android",
  "octoclaus",
  "octopus",
  "oculus",
  "odoo-docker",
  "odoo-hosting",
  "oldwinapi",
  "omnilog",
  "opd-product-browser-web",
  "ops",
  "optional_t",
  "orchestra",
  "ormlite-android-extras",
  "oswitch",
  "p5-App-RedisTop",
  "p5-app-adventcalendar",
  "parallella-utils",
  "paxos",
  "pbd",
  "pct-vim",
  "pebble-faces",
  "pebble-notifier",
  "perl-net-sdp",
  "perl_tools",
  "permag.ir",
  "persistent",
  "persistent_enums",
  "phoenix",
  "phonegap-icon-splash-generator",
  "phonegap-system-notification-plugin",
  "php-apn",
  "php-json-schema",
  "php-o",
  "php-vim",
  "piface",
  "pika_launcher_bot",
  "pimame_installer",
  "placeholders",
  "planet-conquer",
  "platform",
  "play-websockets-example",
  "plugins",
  "plush",
  "policy",
  "polly",
  "polymer_elements",
  "polymer_ui_elements",
  "pomelo_quick_x",
  "posh-awscfn",
  "positronic_net",
  "posz",
  "powerdelivery",
  "powershell.tmbundle",
  "prepan",
  "prime_finder",
  "prover",
  "prustle-rs",
  "pybot",
  "python-gorun",
  "python-ilorest-library-old",
  "python-vimeo",
  "qaul.net_legacy",
  "qrtrack",
  "quart",
  "quimby",
  "rackspacecloud_powershell",
  "ragel-go",
  "rails_admin_tag_list",
  "rails_angular_integration_example",
  "railsready_osx",
  "rancid-cisco-sb",
  "rbytes",
  "rdispatcher",
  "react-starter",
  "recaptcha.nim",
  "recyclerview-multistate-section-endless-adapter",
  "redis-dart",
  "redis-sharding-hs",
  "refinerycms_membership",
  "reflash",
  "reflexdota",
  "resque-heroku-autoscaler",
  "retry",
  "rf.nim",
  "richfaces-sandbox",
  "ril_analyzer",
  "rmilter",
  "rmq",
  "roads-from-nd",
  "robospecs",
  "robotquest",
  "roft",
  "rtf_pygmentize",
  "ruby-haml-js",
  "ruby-sunlight",
  "rust-bitfield-legacy",
  "rust-civet",
  "rust-copperline",
  "rust-error-type",
  "rust-glut",
  "rust-ogldev",
  "rust-pcre",
  "rust-protobuf-macros",
  "rust-worldgen",
  "rustecs",
  "rustray",
  "rustup-powershell",
  "rustymem",
  "rustymine",
  "rxjava-akka",
  "rxjava-essentials",
  "saberma.github.com",
  "saha",
  "sample",
  "sampleapp",
  "sbt-ammonite",
  "sbt-cloudbees-plugin",
  "sbt-grunt-plugin",
  "sbt-proguard-plugin",
  "scala-conduits",
  "scala-js-pickling",
  "scala-tk",
  "scala-xmlsoap-ersatz",
  "scalaz-camel",
  "scaloid-apidemos",
  "scheme-d",
  "semanticizer",
  "sencha-cordova-builder",
  "seq",
  "seqloq",
  "serialized_attributes",
  "serialport",
  "servant-purescript",
  "sflvault",
  "shadow.vim",
  "shorai",
  "should-dsl",
  "simple_bookmarks.vim",
  "sincron",
  "sitecore-nuget-server",
  "slack-integrations",
  "slick-examples",
  "slideuppane",
  "slt2",
  "snap-auth",
  "snowglobe",
  "socky_gem",
  "sofia-ml-mod",
  "sorting-rs",
  "spark-plug",
  "spark-tweets",
  "spark_plug",
  "speaker",
  "speed",
  "sphinx",
  "spills",
  "splclassloader",
  "spm",
  "spongycastle-old",
  "sprangular",
  "spray-aws",
  "spray-example",
  "sprest",
  "sqlite-net-wp8",
  "sshfs",
  "starting_point",
  "stationwagon",
  "statsd",
  "stdex",
  "stitch",
  "stoppableListener",
  "stor",
  "strata_bootcamp",
  "stream_transformers",
  "sugarcrm",
  "superbuffer",
  "swagger-finatra",
  "swftools",
  "swipe-to-refresh-demo",
  "swirl",
  "symbolicatecrash-fix",
  "symfony2-file-uploader-bundle",
  "t_dict",
  "template",
  "terraform-provider-vmware",
  "text_extraction",
  "tharsis.prof",
  "theyoke",
  "thrust",
  "ti-module-share",
  "tictactoe",
  "tiger",
  "tinytest",
  "tinytwitch",
  "tiopengles",
  "titanium-barcode",
  "todo_ddc",
  "todod",
  "tokio-middleware",
  "toml.d",
  "torch-dqn",
  "torch-pastalog",
  "torchneuralconvo",
  "touchbase",
  "trackmac",
  "translator",
  "travis-docker-example",
  "trello-hipchat",
  "trident-lambda-splout",
  "triglav",
  "underscore-perl",
  "unite-colorscheme",
  "unite-ghq",
  "units-d",
  "upcs",
  "updateservicectl",
  "vagrant-chef-zero",
  "vagrant-hadoop-2.4.1-spark-1.0.1",
  "vagrant-phalcon",
  "validations",
  "values",
  "varnishtuner.py",
  "vault",
  "verdict",
  "veripacks",
  "viewducers",
  "vim-monokai-refined",
  "vim-osx-colorpicker",
  "vim-pairs",
  "vim-pep8",
  "vim-raml",
  "vim-redmine",
  "vim-reek",
  "vim-scratch",
  "vim-settings",
  "vim-stringify",
  "vim-unite-history",
  "vim-writingsyntax",
  "vim_colors",
  "vimfiles",
  "vital-power-assert",
  "vkontakte",
  "vlc-lua-sia",
  "volume-from-shadow",
  "vsweb-publish",
  "weibotuchuang",
  "widget",
  "word2vec",
  "wordpress-slice-setup",
  "wpframework",
  "wpsocialite",
  "xamarin-android-crashlytics-binding",
  "xoat",
  "xsbt-cucumber-plugin",
  "xsbt-proguard-plugin",
  "xserver",
  "yaml-vim",
  "yosemite-menu-inverter",
  "zipper",
  "zoot",
  '12306',
  'AFNetworking',
  'APIJSON',
  'AR.js',
  'ARouter',
  'Alamofire',
  'Alcatraz',
  'Android-Debug-Database',
  'Android-ObservableScrollView',
  'Android-PickerView',
  'AndroidNote',
  'AndroidPdfViewer',
  'AndroidPerformanceMonitor',
  'AndroidSwipeLayout',
  'AndroidUtilCode',
  'AppImageKit',
  'Arduino',
  'Ash',
  'AudioKit',
  'Awesome-Swift-Education',
  'Babylon.js',
  'Backbone-relational',
  'BaiduPCS-Go',
  'Blazor',
  'BlocksKit',
  'Carthage',
  'CefSharp',
  'ChakraCore',
  'Chameleon',
  'Clusterize.js',
  'CocoaAsyncSocket',
  'CocoaLumberjack',
  'CocoaPods',
  'CodeHub',
  'CouchPotatoServer',
  'CssToInlineStyles',
  'Dash-iOS',
  'DeepSpeech',
  'DefinitelyTyped',
  'ENViews',
  'EntityFrameworkCore',
  'EventBus',
  'EverydayWechat',
  'FLAnimatedImage',
  'FastHub',
  'FileDownloader',
  'FlameGraph',
  'GPUImage',
  'Gifski',
  'Gource',
  'HMSegmentedControl',
  'HanLP',
  'HarmonyOS',
  'HikariCP',
  'Hilo',
  'Hover',
  'IBAnimatable',
  'IQKeyboardManager',
  'ImageAI',
  'ImageProcessor',
  'ImmersionBar',
  'Inquirer.js',
  'InteractiveViewControllerTransitions',
  'JLRoutes',
  'JSQMessagesViewController',
  'JsBridge',
  'KIF',
  'KaTeX',
  'Keras-GAN',
  'KineticJS',
  'Kingfisher',
  'Laravel-Excel',
  'LightTable',
  'LiquidFloatingActionButton',
  'Lona',
  'MJRefresh',
  'MLAlgorithms',
  'MS-DOS',
  'MWPhotoBrowser',
  'Mac-CLI',
  'MacGap1',
  'MagicalRecord',
  'MahApps.Metro',
  'Mailpile',
  'Mantle',
  'Mars',
  'Material',
  'Material-Animations',
  'MaterialDrawer',
  'MediatR',
  'Moya',
  'MrVector',
  'Mycat-Server',
  'Nim',
  'NoNonsense-FilePicker',
  'OpenRA',
  'OpenRefine',
  'PHP-Parser',
  'PHPExcel',
  'PHP_CodeSniffer',
  'PNChart',
  'PapaParse',
  'Paparazzo',
  'PathFinding.js',
  'PayloadsAllTheThings',
  'Perfect',
  'PermissionScope',
  'PhotoSwipe',
  'PicGo',
  'Pikaday',
  'PlayAnimations',
  'PocketHub',
  'Proton',
  'PyMySQL',
  'Qix',
  'Quick',
  'RAP',
  'RESideMenu',
  'RIBs',
  'Real-Time-Voice-Cloning',
  'ReflectionDocBlock',
  'Reservoir',
  'Rocket.Chat',
  'RoundedImageView',
  'RxJava-Android-Samples',
  'SASM',
  'SDAutoLayout',
  'SDScreenshotCapture',
  'ScrollMagic',
  'SeeFood',
  'Sentinel',
  'SignalR',
  'Slash',
  'SpaceshipGenerator',
  'Spoon-Knife',
  'Spring',
  'SwiftLint',
  'Sylius',
  'TDengine',
  'TTTAttributedLabel',
  'Tars',
  'TrafficMonitor',
  'TypeResolver',
  'TypeScript',
  'TypeScript-Node-Starter',
  'UITableView-FDTemplateLayoutCell',
  'UltimateRecyclerView',
  'UpUp',
  'ViewPagerIndicator',
  'VitamioBundle',
  'Vulcan',
  'WSL',
  'WaveFunctionCollapse',
  'WeChatTweak-macOS',
  'Workerman',
  'XLPagerTabStrip',
  'XSStrike',
  'XYOrigami',
  '_s',
  'acra',
  'aeron',
  'ailab',
  'airflow',
  'algorithm-visualizer',
  'amphtml',
  'android-floating-action-button',
  'android-ktx',
  'android-testing',
  'angular-seed',
  'animated-tab-bar',
  'anime',
  'aos',
  'api',
  'apollo',
  'appium',
  'apropos',
  'arangodb',
  'aria2',
  'art-template',
  'asuswrt-merlin',
  'async',
  'autoComplete.js',
  'autojump',
  'autokeras',
  'ava',
  'awesome-android-tips',
  'awesome-cpp',
  'awesome-flask',
  'awesome-laravel',
  'awesome-scala',
  'awesome-shell',
  'awesomplete',
  'babel',
  'babel-preset-env',
  'babun',
  'baiduyun',
  'bash-it',
  'bat',
  'bazel',
  'beeswithmachineguns',
  'beets',
  'bgfx',
  'bilibili-mac-client',
  'bitcoinbook',
  'bk-cmdb',
  'blockly',
  'bokeh',
  'bolt',
  'bootstrap-select',
  'bootswatch',
  'botkit',
  'boto',
  'botpress',
  'bourbon',
  'bower',
  'brackets',
  'brew',
  'brook',
  'brotli',
  'browser-laptop',
  'browser-sync',
  'browserify',
  'bullet',
  'bullet3',
  'bulma',
  'butterknife',
  'byob',
  'c3',
  'capnproto',
  'carbon',
  'cat',
  'ccv',
  'centrifugo',
  'chalice',
  'chalk',
  'choo',
  'cleaver',
  'cli',
  'click',
  'clojurescript',
  'closure-compiler',
  'cloud-torrent',
  'cmder',
  'codecombat',
  'codelf',
  'collect.js',
  'composer',
  'connect',
  'core',
  'covfefe',
  'css-only-chat',
  'css-selector',
  'cubism',
  'cucumber-ruby',
  'curl',
  'cypress',
  'd4',
  'darkflow',
  'dbeaver',
  'dc.js',
  'deep-image-prior',
  'deep-residual-networks',
  'deepo',
  'delve',
  'deno',
  'design-blocks',
  'devdocs',
  'devtool',
  'dgraph',
  'diaspora',
  'dio',
  'discourse',
  'disruptor',
  'distroless',
  'django-allauth',
  'django-cms',
  'django-debug-toolbar',
  'dlib',
  'dlite',
  'dm-core',
  'dnscat2',
  'docker-elk',
  'docusaurus',
  'dotenv',
  'draggable',
  'dsjslib',
  'ducks-modular-redux',
  'dva',
  'easyexcel',
  'echo',
  'editor.js',
  'elasticsearch-analysis-ik',
  'elasticsearch-kopf',
  'electron',
  'electron-builder',
  'electron-react-boilerplate',
  'electronic-wechat',
  'emacs.d',
  'emojicon',
  'enclave',
  'envoy',
  'eos',
  'es5-shim',
  'esprima',
  'ethereumbook',
  'eureka',
  'f2',
  'f8app',
  'fabric',
  'face-api.js',
  'face_recognition',
  'faceswap',
  'faker.js',
  'falcon',
  'falcon-plus',
  'fasthttp',
  'fastnetmon',
  'favorites-web',
  'fbctf',
  'fd',
  'feathers',
  'filepond',
  'finagle',
  'fingerprintjs2',
  'fishhook',
  'fks',
  'flatbuffers',
  'flatpickr',
  'flexbugs',
  'flipper',
  'flv.js',
  'flysystem',
  'fmt',
  'folly',
  'foundationdb',
  'fpm',
  'framework',
  'freegeoip',
  'friendly_id',
  'frontend-guidelines',
  'frozenui',
  'frp',
  'functions-samples',
  'gatsby',
  'git-extras',
  'github-cheat-sheet',
  'gitignore.io',
  'gitleaks',
  'gjson',
  'glances',
  'gmail',
  'go-github',
  'gocui',
  'godot',
  'gogs',
  'google-api-nodejs-client',
  'googletest',
  'goreplay',
  'gotty',
  'graphene',
  'graphql-playground',
  'grpc-go',
  'grpc-java',
  'hadoop',
  'hanami',
  'haven',
  'helmet',
  'hexo-theme-material',
  'high-speed-downloader',
  'highlight.js',
  'hint.css',
  'hogan.js',
  'homebridge',
  'horovod',
  'hotkeys',
  'htaccess',
  'html5shiv',
  'http-kernel',
  'http-prompt',
  'hubot-slack',
  'hugo',
  'hyperapp',
  'hyperopt',
  'iOSProject',
  'ice',
  'ifvisible.js',
  'iina',
  'ijkplayer',
  'imgui',
  'impress.js',
  'incubator-druid',
  'incubator-superset',
  'incubator-weex',
  'inferno',
  'inflector',
  'instantclick',
  'instantiator',
  'instaparse',
  'interview',
  'ion',
  'ios-oss',
  'iosched',
  'ipython',
  'iris',
  'itsabot',
  'ivideo',
  'jQuery-File-Upload',
  'jQuery-Knob',
  'jQuery-menu-aim',
  'janus',
  'java8-tutorial',
  'javascript-patterns',
  'jedis',
  'jenkins',
  'johnny-five',
  'jquery',
  'jquery-mobile',
  'jquery.complexify.js',
  'js-cookie',
  'jsdom',
  'jsplumb',
  'jstips',
  'junit4',
  'jupyter',
  'jupyter-themes',
  'jupyterlab',
  'jwt-go',
  'kap',
  'kcptun',
  'keep-a-changelog',
  'kit',
  'kitematic',
  'kivy',
  'knockout',
  'labelImg',
  'laptop',
  'laradock',
  'laravel-debugbar',
  'laravel-ide-helper',
  'lawnchair',
  'lazydocker',
  'leaf',
  'learn-go-with-tests',
  'learningPixi',
  'learnyounode',
  'legacy-homebrew',
  'legit',
  'lerna',
  'lexer',
  'libra',
  'libzmq',
  'lime',
  'linkerd',
  'list.js',
  'loaders.css',
  'localstack',
  'localtunnel',
  'locust',
  'logrus',
  'lumen',
  'luxon',
  'mac-setup',
  'macvim',
  'magento2',
  'majestic',
  'markdown-in-js',
  'markdown-it',
  'maskrcnn-benchmark',
  'math-as-code',
  'medium-editor',
  'metabase',
  'metrics',
  'metrics-graphics',
  'micro',
  'microsoft.github.io',
  'mkcert',
  'mobx',
  'moby',
  'mockito',
  'monica',
  'mono',
  'mopidy',
  'mosby',
  'mosh',
  'multer',
  'musicbox',
  'ncnn',
  'netty',
  'networkx',
  'new-pac',
  'next-plugins',
  'ng2-material',
  'nginx-proxy',
  'ngx-bootstrap',
  'nock',
  'nodal',
  'node-formidable',
  'node-inspector',
  'node-jsonwebtoken',
  'node-mongodb-native',
  'node-postgres',
  'node-xml2js',
  'node_redis',
  'nodeclub',
  'nodemon',
  'nokogiri',
  'notable',
  'notebook',
  'npgsql',
  'npm',
  'ntfy',
  'nui',
  'nuklear',
  'nvd3',
  'nw.js',
  'nylas-mail',
  'objectify',
  'obs-studio',
  'og-aws',
  'omniauth',
  'onnx',
  'openpilot',
  'openscad',
  'os-tutorial',
  'osquery',
  'overleaf',
  'packer',
  'page.js',
  'pandas',
  'paper.js',
  'paramiko',
  'parse-server',
  'pdfmake',
  'perfmap',
  'phantomjs-node',
  'phoenix',
  'phpunit',
  'picasso',
  'pickadate.js',
  'piskel',
  'plugins',
  'plyr',
  'pm2',
  'pnpm',
  'pokedex.org',
  'poly-picker',
  'pq',
  'prerender-spa-plugin',
  'prettier',
  'promises',
  'proxygen',
  'puppeteer',
  'purescript',
  'purplecoat.js',
  'pyecharts',
  'pyjwt',
  'pytext',
  'python-fire',
  'python-spider',
  'python-telegram-bot',
  'pytorch-CycleGAN-and-pix2pix',
  'pytudes',
  'qBittorrent',
  'qmk_firmware',
  'qr-code',
  'qt',
  'quietnet',
  'rabl',
  'rails_admin',
  'rancher',
  'random_compat',
  'rbenv',
  'react',
  'react-admin',
  'react-beautiful-dnd',
  'react-hot-loader',
  'react-jsonschema-form',
  'react-native',
  'react-native-macos',
  'react-native-navigation',
  'react-native-nw-react-calculator',
  'react-native-router-flux',
  'react-native-vector-icons',
  'react-navigation',
  'react-sortable-hoc',
  'react-table',
  'reactstrap',
  'readthedocs.org',
  'realworld',
  'rebound',
  'recharts',
  'recompose',
  'recyclerview-animators',
  'redigo',
  'redmine',
  'redox',
  'redux-devtools',
  'redux-devtools-extension',
  'redux-observable',
  'redux-saga',
  'regexr',
  'relay',
  'requests',
  'requests-html',
  'requirejs',
  'rickshaw',
  'ring',
  'ripgrep',
  'robomongo',
  'rocksdb',
  'rollup',
  'rough',
  'routing',
  's-tui',
  'scalatra',
  'scoop',
  'scrcpy',
  'scylla',
  'seajs',
  'seamless-immutable',
  'seata',
  'seaweedfs',
  'server',
  'servo',
  'shadowsocks-android',
  'shadowsocks-manager',
  'shadowsocks-qt5',
  'sharp',
  'shellcheck',
  'shenzhen',
  'showdown',
  'signature_pad',
  'simple-cache',
  'simple-icons',
  'simplemde-markdown-editor',
  'single-spa',
  'skynet',
  'slack-term',
  'slate',
  'slick',
  'sly',
  'socket.io',
  'sockjs-client',
  'solid',
  'solidity',
  'solo',
  'sonnet',
  'sovereign',
  'spacegray',
  'spark',
  'spectrum',
  'speedtest-cli',
  'spree',
  'sqlmap',
  'ssh-chat',
  'stackedit',
  'startbootstrap-sb-admin-2',
  'stb',
  'steak',
  'store.js',
  'structor',
  'structured-text-tools',
  'stylegan',
  'sublimetext-markdown-preview',
  'sunflower',
  'svgo',
  'svgr',
  'swc',
  'swift-corelibs-foundation',
  'swift-nio',
  'swiper',
  'symfony',
  'syntaxhighlighter',
  'systemjs',
  'tabIndent.js',
  'tabler',
  'tensorflow',
  'tensorpack',
  'terminal',
  'terminal-notifier',
  'terminus',
  'tesseract',
  'text_classification',
  'textql',
  'the-super-tiny-compiler',
  'theia',
  'tidb',
  'tig',
  'timescaledb',
  'tinker',
  'tinycon',
  'tmux-resurrect',
  'tmuxinator',
  'traefik',
  'truffle',
  'trump2cash',
  'tui.calendar',
  'twisted',
  'typeahead.js',
  'typecho',
  'ui',
  'uikit',
  'underscore',
  'uni-app',
  'unicorn',
  'uppy',
  'v2ray-core',
  'vConsole',
  'vagrant',
  'validator.js',
  'vega',
  'vex',
  'vim-galore',
  'vim-go',
  'vim-pathogen',
  'vimium',
  'visdom',
  'vue',
  'vue-storefront',
  'vue-strap',
  'vue-sui-demo',
  'vuex',
  'waifu2x',
  'walk',
  'wallet',
  'webmagic',
  'webpack-dashboard',
  'websocketd',
  'wechat-app-mall',
  'wechat_jump_game',
  'wekan',
  'wepy',
  'weui-wxss',
  'will_paginate',
  'winston',
  'wraith',
  'wxBot',
  'x-ray',
  'x64dbg',
  'xUtils3',
  'xbmc',
  'xbmc-addons-chinese',
  'xctool',
  'yapi',
  'yoga',
  'z',
  'zap',
  'zdog',
  'zeal',
  'zookeeper',
  'zsh-autosuggestions',
  'zstd',
);


for my $directory (@repositories){
  # Tar the entire thing first
  my $all_command = "find 'repositories/$directory' "
    . join(" -o ", @all_filetypes)
    . ' | tar -cf tars/' . $directory . '_all.tar -T -';
  my $all_return = `$all_command`;
  print STDERR $all_return;

  for my $language (keys %$supported_filetypes){
    my @extensions = map { '-name "*.' . $_ . '"' } @{$supported_filetypes->{$language}};
    my $command = "find 'repositories/$directory' "
        . join(" -o ", @extensions)
      . ' | tar -cf tars/' . $directory . '_' . $language . '.tar -T -'
    ;

    my $return = `$command`;
    print STDERR $return;
    if($return){print STDERR $command;}
  }
}
