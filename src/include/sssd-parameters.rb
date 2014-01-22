# encoding: utf-8

# File: include/auth-client/sssd-parameters.rb
# Package:      Configuration of auth-client
# Summary:      The sssd.conf parameters
# Authors:      Peter Varkoly <varkoly@suse.de>
#
module Yast
  module AuthClientSssdParametersInclude
    def initialize_auth_client_sssd_parameters(include_target)
        textdomain "auth-client"
        @params = {
                   #Define Global Parameters
                   "sssd" => {
                        "config_file_version" => {
                            "type" => "int",
                            "desc" => _("Indicates what is the syntax of the config file.")
                        },
                        "services" => {
                            "type" => "string",
                            "vals" => "nss, pam, sudo, autofs, ssh",
                            "desc" => _("Comma separated list of services that are started when sssd itself starts.")
                        },
                        "reconnection_retries" => {
                            "type" => "int",
                            "def"  => 3,
                            "desc" => _("Number of times services should attempt to reconnect in the event of a Data Provider crash or restart before they give up" )
                        },
                        "domains" => {
                            "type" => "string",
                            "desc" => _("SSSD can use more domains at the same time, but at least one must be configured or SSSD won't start.") +
                                      _("This parameter described the list of domains in the order you want them to be queried.")
                        },
                        "re_expression" => {
                            "type" => "string",
                            "desc" => _("Default regular expression that describes how to parse the string containing user name and domain into these components")
                        },
                        "full_name_format" => {
                            "type" => "string",
                            "desc" => _("The default printf(3)-compatible format that describes how to translate a (name, domain) tuple into a fully qualified name.")
                        },
                        "try_inotify" => {
                            "type" => "boolean",
                            "desc" => _("SSSD monitors the state of resolv.conf to identify when it needs to update its internal DNS resolver.") +
                                      _("By default, we will attempt to use inotify for this, and will fall back to polling resolv.conf every five seconds if inotify cannot be used.")
                        },
                        "krb5_rcache_dir" => {
                            "type" => "string",
                            "desc" => _("Directory on the filesystem where SSSD should store Kerberos replay cache files.")
                        },
                        "default_domain_suffix" => {
                            "type" => "string",
                            "desc" => _("This string will be used as a default domain name for all names without a domain name component.")
                        }
                   },
                   #Define Global Services Parameters
                   "services" => {
                        "debug_level" => {
                            "type" => "int",
                            "desc" => _("Bit mask that indicates which debug levels will be visible. 0x0010 is the default value as well as the lowest allowed value, 0xFFF0 is the most verbose mode.")
                        },
                        "debug_timestamps" => {
                            "type" => "boolean",
                            "def"  => true,
                            "desc" => _("Add a timestamp to the debug messages")
                        },
                        "debug_microseconds" => {
                            "type" => "boolean",
                            "def"  => false,
                            "desc" => _("Add microseconds to the timestamp in debug messages")
                        },
                        "timeout" => {
                            "type" => "int",
                            "def"  => 10,
                            "desc" => _("Timeout in seconds between heartbeats for this service.")
                        },
                        "reconnection_retries" => {
                            "type" => "int",
                            "def"  => 3,
                            "desc" => _("Number of times services should attempt to reconnect in the event of a Data Provider crash or restart before they give up")
                        },
                        "fd_limit" => {
                            "type" => "int",
                            "def"  =>  8192,
                            "desc" => _("This option specifies the maximum number of file descriptors that may be opened at one time by this SSSD process.") 
                        },
                        "client_idle_timeout" => {
                            "type" => "int",
                            "def"  =>  60,
                            "desc" => _("This option specifies the number of seconds that a client of an SSSD process can hold onto a file descriptor without communicating on it.")
                        },
                        "force_timeout" => {
                            "type" => "int",
                            "def"  =>  60,
                            "desc" => _("If a service is not responding to ping checks (see the “timeout” option), it is first sent the SIGTERM signal that instructs it to quit gracefully.")
                        }
                   },
                   #NSS configuration options
                   "nss" => {
                        "enum_cache_timeout" => {
                            "type" => "int",
                            "def"  =>  120,
                            "desc" => _("How many seconds should nss_sss cache enumerations (requests for info about all users)")
                        },
                        "entry_cache_nowait_percentage" => {
                            "type" => "int",
                            "def"  =>  50,
                            "desc" => _("The entry cache can be set to automatically update entries in the background if they are requested beyond a percentage of the entry_cache_timeout value for the domain.")
                        },
                        "entry_negative_timeout" => {
                            "type" => "int",
                            "def"  =>  15,
                            "desc" => _("Specifies for how many seconds nss_sss should cache negative cache hits (that is, queries for invalid database entries, like nonexistent ones) before asking the back end again.")
                        },
                        "filter_users" => {
                            "type" => "string",
                            "def"  =>  "root",
                            "desc" => _("Exclude certain users from being fetched from the sss NSS database.")
                        },
                        "filter_groups" => {
                            "type" => "string",
                            "def"  =>  "root",
                            "desc" => _("Exclude certain groups from being fetched from the sss NSS database.")
                        },
                        "filter_users_in_groups" => {
                            "type" => "boolean",
                            "def"  =>  true,
                            "desc" => _("If you want filtered user still be group members set this option to false.")
                        },
                        "override_homedir" => {
                            "type" => "string",
                            "desc" => _("Override the user's home directory. You can either provide an absolute value or a template.")
                        },
                        "fallback_homedir" => {
                            "type" => "string",
                            "desc" => _("Set a default template for a user's home directory if one is not specified explicitly by the domain's data provider.")
                        },
                        "override_shell" => {
                            "type" => "string",
                            "desc" => _("Override the login shell for all users.")
                        },
                        "allowed_shells" => {
                            "type" => "string",
                            "desc" => _("Restrict user shell to one of the listed values.")
                        },
                        "vetoed_shells" => {
                            "type" => "string",
                            "desc" => _("Replace any instance of these shells with the shell_fallback")
                        },
                        "shell_fallback" => {
                            "type" => "string",
                            "def"  => "/bin/sh",
                            "desc" => _("The default shell to use if an allowed shell is not installed on the machine.")
                        },
                        "default_shell" => {
                            "type" => "string",
                            "desc" => _("The default shell to use if the provider does not return one during lookup.")
                        },
                        "get_domains_timeout" => {
                            "type" => "int",
                            "def"  => 60,
                            "desc" => _("Specifies time in seconds for which the list of subdomains will be considered valid.")
                        },
                        "memcache_timeout" => {
                            "type" => "int",
                            "def"  => 300,
                            "desc" => _("Specifies time in seconds for which records in the in-memory cache will be valid")
                        }
                   },
                   #PAM configuration options
                   "pam" => {
                        "offline_credentials_expiration" => {
                            "type" => "int",
                            "def"  => 0,
                            "desc" => _("If the authentication provider is offline, how long should we allow cached logins (in days since the last successful online login).")
                        },
                        "offline_failed_login_attempts" => {
                            "type" => "int",
                            "def"  => 0,
                            "desc" => _("The time in minutes which has to pass after offline_failed_login_attempts has been reached before a new login attempt is possible.")
                        },
                        "offline_failed_login_delay" => {
                            "type" => "int",
                            "def"  => 5,
                            "desc" => _("The time in minutes which has to pass after offline_failed_login_attempts has been reached before a new login attempt is possible.")
                        },
                        "pam_verbosity" => {
                            "type" => "int",
                            "def"  => 1,
                            "desc" => _("Controls what kind of messages are shown to the user during authentication.")
                        },
                        "pam_id_timeout" => {
                            "type" => "int",
                            "def"  => 5,
                            "desc" => _("For any PAM request while SSSD is online, the SSSD will attempt to immediately update the cached identity information for the user in order to ensure that authentication takes place with the latest information.")
                        },
                        "pam_pwd_expiration_warning" => {
                            "type" => "int",
                            "def"  => 0,
                            "desc" => _("Display a warning N days before the password expires.")
                        },
                        "get_domains_timeout" => {
                            "type" => "int",
                            "def"  => 60,
                            "desc" => _("Specifies time in seconds for which the list of subdomains will be considered valid.")
                        }
                  },
                  #SUDO configuration options
                  "sudo" => {
                        "sudo_timed" => {
                            "type" => "boolean",
                            "def"  => false,
                            "desc" => _("Whether or not to evaluate the sudoNotBefore and sudoNotAfter attributes that implement time-dependent sudoers entries.")
                        }
                  },
                  #AUTOFS configuration options
                  "autofs" => {
                        "autofs_negative_timeout" => {
                            "type" => "int",
                            "def"  => 15,
                            "desc" => _("Specifies for how many seconds should the autofs responder negative cache hits before asking the back end again.")
                        }
                  },
                  #SSH configuration options
                  "ssh" => {
                        "ssh_hash_known_hosts" => {
                            "type" => "boolean",
                            "def"  => true,
                            "desc" => _("Whether or not to hash host names and addresses in the managed known_hosts file.")
                        },
                        "ssh_known_hosts_timeout" => {
                            "type" => "int",
                            "def"  => 100,
                            "desc" => _("How many seconds to keep a host in the managed known_hosts file after its host keys were requested.")
                        }
                  },
                  #DOMAIN SECTIONS
                  #These configuration options can be present in a domain configuration section, that is, in a section called “[domain/NAME]”
                  "domain" => {
                        "min_id" => {
                            "type" => "int",
                            "def"  => 1,
                            "desc" => _("UID and GID limits for the domain. If a domain contains an entry that is outside these limits, it is ignored.")
                        },
                        "max_id" => {
                            "type" => "int",
                            "def"  => 0,
                            "desc" => _("UID and GID limits for the domain. If a domain contains an entry that is outside these limits, it is ignored.")
                        },
                        "enumerate" => {
                            "type" => "bool",
                            "def"  => false,
                            "desc" => _("Determines if a domain can be enumerated.")
                        },
                        "force_timeout" => {
                            "type" => "int",
                            "def"  => 60,
                            "desc" => _("If the service does not terminate after “force_timeout” seconds, the monitor will forcibly shut it down by sending a SIGKILL signal")
                        },
                        "entry_cache_timeout" => {
                            "type" => "int",
                            "def"  => 5400,
                            "desc" => _("How many seconds should nss_sss consider entries valid before asking the backend again.")
                        },
                        "entry_cache_user_timeout" => {
                            "type" => "int",
                            "def"  => "entry_cache_timeout",
                            "desc" => _("How many seconds should nss_sss consider user entries valid before asking the backend again.")
                        },
                        "entry_cache_group_timeout" => {
                            "type" => "int",
                            "def"  => "entry_cache_timeout",
                            "desc" => _("How many seconds should nss_sss consider group entries valid before asking the backend again.")
                        },
                        "entry_cache_netgroup_timeout" => {
                            "type" => "int",
                            "def"  => "entry_cache_timeout",
                            "desc" => _("How many seconds should nss_sss consider netgroup entries valid before asking the backend again.")
                        },
                        "entry_cache_service_timeout" => {
                            "type" => "int",
                            "def"  => "entry_cache_timeout",
                            "desc" => _("How many seconds should nss_sss consider service entries valid before asking the backend again.")
                        },
                        "entry_cache_sudo_timeout" => {
                            "type" => "int",
                            "def"  => "entry_cache_timeout",
                            "desc" => _("How many seconds should sudo consider rules valid before asking the backend again.")
                        },
                        "entry_cache_autofs_timeout" => {
                            "type" => "int",
                            "def"  => "entry_cache_timeout",
                            "desc" => _("How many seconds should the autofs service consider automounter maps valid before asking the backend again.")
                        },
                        "cache_credentials" => {
                            "type" => "boolean",
                            "def"  => false,
                            "desc" => _("Determines if user credentials are also cached in the local LDB cache")
                        },
                        "account_cache_expiration" => {
                            "type" => "int",
                            "def"  => 0,
                            "desc" => _("Number of days entries are left in cache after last successful login before being removed during a cleanup of the cache.")
                        },
                        "id_provider" => {
                            "type" => "string",
                            "vals" => "ldap, local, ipa, ad",
                            "desc" => _("The identification provider used for the domain.")
                        },
                        "use_fully_qualified_names" => {
                            "type" => "boolean",
                            "def"  => false,
                            "desc" => _("Use the full name and domain (as formatted by the domain's full_name_format) as the user's login name reported to NSS.")
                        },
                        "auth_provider" => {
                            "type" => "string",
                            "vals" => "ldap, krb5, ipa, ad, proxy, none",
                            "def"  => "id_provider",
                            "desc" => _("The authentication provider used for the domain.")
                        },
                        "access_provider" => {
                            "type" => "string",
                            "vals" => "permit, deny, ldap, ipa, ad, simple",
                            "def"  => "permit",
                            "desc" => _("The access control provider used for the domain.")
                        },
                        "chpass_provider" => {
                            "type" => "string",
                            "vals" => "ldap, krb5, ipa, ad, proxy, none",
                            "def"  => "auth_provider",
                            "desc" => _("The provider which should handle change password operations for the domain.")
                        },
                        "sudo_provider" => {
                            "type" => "string",
                            "def"  => "id_provider",
                            "vals" => "ldap, none",
                            "desc" => _("The SUDO provider used for the domain.")
                        },
                        "selinux_provider" => {
                            "type" => "string",
                            "def"  => "id_provider",
                            "vals" => "ipa, none",
                            "desc" => _("The provider which should handle loading of selinux settings.")
                        },
                        "subdomains_provider" => {
                            "type" => "string",
                            "def"  => "id_provider",
                            "vals" => "ipa, none",
                            "desc" => _("The provider which should handle fetching of subdomains.")
                        },
                        "autofs_provider" => {
                            "type" => "string",
                            "def"  => "id_provider",
                            "vals" => "ldap, ipa, none",
                            "desc" => _("The autofs provider used for the domain.")
                        },
                        "hostid_provider" => {
                            "type" => "string",
                            "def"  => "id_provider",
                            "vals" => "ipa, none",
                            "desc" => _("The provider used for retrieving host identity information.")
                        },
                        "re_expression" => {
                            "type" => "string",
                            "def"  => '(((?P<domain>[^\\]+)\\(?P<name>.+$))|((?P<name>[^@]+)@(?P<domain>.+$))|(^(?P<name>[^@\\]+)$))',
                            "desc" => _("Regular expression for this domain that describes how to parse the string containing user name and domain into these components.")
                        },
                        "full_name_format" => {
                            "type" => "string",
                            "def"  => "%1$s@%2$s",
                            "desc" => _("A printf(3)-compatible format that describes how to translate a (name, domain) tuple for this domain into a fully qualified name.")
                        },
                        "lookup_family_order" => {
                            "type" => "string",
                            "def"  => "ipv4_first",
                            "vals" => "ipv4_first, ipv4_only, ipv6_first, ipv6_only",
                            "desc" => _("Provides the ability to select preferred address family to use when performing DNS lookups.")
                        },
                        "dns_resolver_timeout" => {
                            "type" => "int",
                            "def"  => 5,
                            "desc" => _("Defines the amount of time (in seconds) to wait for a reply from the DNS resolver before assuming that it is unreachable.")
                        },
                        "dns_discovery_domain" => {
                            "type" => "string",
                            "def"  => _("Use the domain part of machine's hostname"),
                            "desc" => _("If service discovery is used in the back end, specifies the domain part of the service discovery DNS query.")
                        },
                        "override_gid" => {
                            "type" => "int",
                            "desc" => _("Override the primary GID value with the one specified.")
                        },
                        "case_sensitive" => {
                            "type" => "boolean",
                            "def"  => true,
                            "desc" => _("Treat user and group names as case sensitive.")
                        },
                        "proxy_fast_alias" => {
                            "type" => "boolean",
                            "def"  => false,
                            "desc" => _("When a user or group is looked up by name in the proxy provider, a second lookup by ID is performed to 'canonicalize' the name in case the requested name was an alias.")
                        },
                        "subdomain_homedir" => {
                            "type" => "string",
                            "def"  => "/home/%d/%u",
                            "desc" => _("Use this homedir as default value for all subdomains within this domain.")
                        },
                        # Following options will be provided by SSSD's 'simple' access-control provider
                        "simple_allow_users" => {
                            "type" => "string",
                            "def"  => "",
                            "desc" => _("Comma separated list of users who are allowed to log in.")
                        },
                        "simple_allow_groups" => {
                            "type" => "string",
                            "def"  => "",
                            "desc" => _("Comma separated list of groups who are allowed to log in. This applies only to groups within this SSSD domain.")
                        },
                        "simple_deny_users" => {
                            "type" => "string",
                            "def"  => "",
                            "desc" => _("Comma separated list of users who are explicitly denied access.")
                        },
                        "simple_deny_users" => {
                            "type" => "string",
                            "def"  => "",
                            "desc" => _("Comma separated list of groups that are explicitly denied access. This applies only to groups within this SSSD domain.")
                        }
                   },
                   #The local domain section
                   #This section contains settings for domain that stores users and groups in SSSD native database, that is, a domain that uses id_provider=local.
                   "local" => {
                        "base_directory" => {
                            "type" => "string",
                            "def"  => "/home",
                            "desc" => _("The tools append the login name to base_directory and use that as the home directory.")
                        },
                        "create_homedir" => {
                            "type" => "boolean",
                            "def"  => true,
                            "desc" => _("Indicate if a home directory should be created by default for new users.")
                        },
                        "remove_homedir" => {
                            "type" => "boolean",
                            "def"  => true,
                            "desc" => _("Indicate if a home directory should be removed by default for deleted users.")
                        },
                        "homedir_umask" => {
                            "type" => "string",
                            "def"  => "077",
                            "desc" => _("Used by sss_useradd(8) to specify the default permissions on a newly created home directory.")
                        },
                        "skel_dir" => {
                            "type" => "string",
                            "def"  => "/etc/skel",
                            "desc" => _("The skeleton directory, which contains files and directories to be copied in the user's home directory, when the home directory is created by sss_useradd(8)")
                        },
                        "mail_dir" => {
                            "type" => "string",
                            "def"  => "/var/mail",
                            "desc" => _("The mail spool directory.")
                        },
                        "userdel_cmd" => {
                            "type" => "string",
                            "desc" => _("The command that is run after a user is removed.")
                        }
                   },
                   #The ldap domain section
                   "ldap" => {
                        "ldap_uri" => {
                            "type" => "string",
                            "req"  => 1,
                            "desc" => _("Specifies the comma-separated list of URIs of the LDAP servers to which SSSD should connect in the order of preference.")
                        },
                        "ldap_backup_uri" => {
                            "type" => "string",
                            "desc" => _("Specifies the comma-separated list of URIs of the LDAP servers to which SSSD should connect in the order of preference.")
                        },
                        "ldap_chpass_uri" => {
                            "type" => "string",
                            "def"  => "ldap_uri",
                            "desc" => _("Specifies the comma-separated list of URIs of the LDAP servers to which SSSD should connect in the order of preference to change the password of a user.")
                        },
                        "ldap_chpass_backup_uri" => {
                            "type" => "string",
                            "def"  => "ldap_uri",
                            "desc" => _("Specifies the comma-separated list of URIs of the LDAP servers to which SSSD should connect in the order of preference to change the password of a user.")
                        },
                        "ldap_search_base" => {
                            "type" => "string",
                            "req"  => 1,
                            "desc" => _("The default base DN to use for performing LDAP user operations.")
                        },
                        "ldap_schema" => {
                            "type" => "string",
                            "vals" => "rfc2307, rfc2307bis, ipa, ad",
                            "def"  => "rfc2307",
                            "desc" => _("Specifies the Schema Type in use on the target LDAP server.")
                        },
                        "ldap_default_bind_dn" => {
                            "type" => "string",
                            "desc" => _("The default bind DN to use for performing LDAP operations.")
                        },
                        "ldap_default_authtok_type" => {
                            "type" => "string",
                            "vals" => "password, obfuscated_password",
                            "def"  => "password",
                            "desc" => _("The type of the authentication token of the default bind DN.")
                        },
                        "ldap_default_authtok" => {
                            "type" => "string",
                            "desc" => _("The authentication token of the default bind DN.")
                        },
                        "ldap_user_object_class" => {
                            "type" => "string",
                            "def"  => "posixAccount",
                            "desc" => _("The object class of a user entry in LDAP.")
                        },
                        "ldap_user_name" => {
                            "type" => "string",
                            "def"  => "uid",
                            "desc" => _("The LDAP attribute that corresponds to the user's login name.")
                        },
                        "ldap_user_uid_number" => {
                            "type" => "string",
                            "def"  => "uidNumber",
                            "desc" => _("The LDAP attribute that corresponds to the user's id.")
                        },
                        "ldap_user_gid_number" => {
                            "type" => "string",
                            "def"  => "gidNumber",
                            "desc" => _("The LDAP attribute that corresponds to the user's primary group id.")
                        },
                        "ldap_user_gecos" => {
                            "type" => "string",
                            "def"  => "gecos",
                            "desc" => _("The LDAP attribute that corresponds to the user's gecos field.")
                        },
                        "ldap_user_home_directory" => {
                            "type" => "string",
                            "def"  => "homeDirectory",
                            "desc" => _(" The LDAP attribute that contains the name of the user's home directory.")
                        },
                        "ldap_user_shell" => {
                            "type" => "string",
                            "def"  => "loginShell",
                            "desc" => _("The LDAP attribute that contains the path to the user's default shell.")
                        },
                        "ldap_user_uuid" => {
                            "type" => "string",
                            "def"  => "nsUniqueId",
                            "desc" => _("The LDAP attribute that contains the UUID/GUID of an LDAP user object.")
                        },
                        "ldap_user_objectsid" => {
                            "type" => "string",
                            "def"  => "objectSid for ActiveDirectory, not set for other servers.",
                            "desc" => _("The LDAP attribute that contains the objectSID of an LDAP user object.")
                        },
                        "ldap_user_modify_timestamp" => {
                            "type" => "string",
                            "def"  => "modifyTimestamp",
                            "desc" => _("The LDAP attribute that contains timestamp of the last modification of the parent object.")
                        },
                        "ldap_user_shadow_last_change" => {
                            "type" => "string",
                            "def"  => "shadowLastChange",
                            "desc" => _("When using ldap_pwd_policy=shadow, this parameter contains the name of an LDAP attribute corresponding to its shadow(5) counterpart (date of the last password change).")
                        },
                        "ldap_user_shadow_min" => {
                            "type" => "string",
                            "def"  => "shadowMin",
                            "desc" => _("When using ldap_pwd_policy=shadow, this parameter contains the name of an LDAP attribute corresponding to its shadow(5) counterpart (minimum password age).")
                        },
                        "ldap_user_shadow_max" => {
                            "type" => "string",
                            "def"  => "shadowMax",
                            "desc" => _("When using ldap_pwd_policy=shadow, this parameter contains the name of an LDAP attribute corresponding to its shadow(5) counterpart (maximum password age).")
                        },
                        "ldap_user_shadow_warning" => {
                            "type" => "string",
                            "def"  => "shadowWarning",
                            "desc" => _("When using ldap_pwd_policy=shadow, this parameter contains the name of an LDAP attribute corresponding to its shadow(5) counterpart (password warning period).")
                        },
                        "ldap_user_shadow_inactive" => {
                            "type" => "string",
                            "def"  => "shadowInactive",
                            "desc" => _("When using ldap_pwd_policy=shadow, this parameter contains the name of an LDAP attribute corresponding to its shadow(5) counterpart (password inactivity period).")
                        },
                        "ldap_user_shadow_expire" => {
                            "type" => "string",
                            "def"  => "shadowExpire",
                            "desc" => _("When using ldap_pwd_policy=shadow or ldap_account_expire_policy=shadow, this parameter contains the name of an LDAP attribute corresponding to its shadow(5) counterpart (account expiration date).")
                        },
                        "ldap_user_krb_last_pwd_change" => {
                            "type" => "string",
                            "def"  => "krbLastPwdChange",
                            "desc" => _("When using ldap_pwd_policy=mit_kerberos, this parameter contains the name of an LDAP attribute storing the date and time of last password change in kerberos.")
                        },
                        "ldap_user_krb_password_expiration" => {
                            "type" => "string",
                            "def"  => "krbPasswordExpiration",
                            "desc" => _("When using ldap_pwd_policy=mit_kerberos, this parameter contains the name of an LDAP attribute storing the date and time when current password expires.")
                        },
                        "ldap_user_ad_account_expires" => {
                            "type" => "string",
                            "def"  => "accountExpires",
                            "desc" => _("When using ldap_account_expire_policy=ad, this parameter contains the name of an LDAP attribute storing the expiration time of the account.")
                        },
                        "ldap_user_ad_user_account_control" => {
                            "type" => "string",
                            "def"  => "userAccountControl",
                            "desc" => _("When using ldap_account_expire_policy=ad, this parameter contains the name of an LDAP attribute storing the user account control bit field.")
                        },
                        "ldap_ns_account_lock" => {
                            "type" => "string",
                            "def"  => "nsAccountLock",
                            "desc" => _("When using ldap_account_expire_policy=rhds or equivalent, this parameter determines if access is allowed or not.")
                        },
                        "ldap_user_nds_login_disabled" => {
                            "type" => "string",
                            "def"  => "loginDisabled",
                            "desc" => _("When using ldap_account_expire_policy=nds, this attribute determines if access is allowed or not.")
                        },
                        "ldap_user_nds_login_expiration_time" => {
                            "type" => "string",
                            "def"  => "loginDisabled",
                            "desc" => _("When using ldap_account_expire_policy=nds, this attribute determines until which date access is granted.")
                        },
                        "ldap_user_nds_login_allowed_time_map" => {
                            "type" => "string",
                            "def"  => "loginAllowedTimeMap",
                            "desc" => _("When using ldap_account_expire_policy=nds, this attribute determines the hours of a day in a week when access is granted.")
                        },
                        "ldap_user_principal" => {
                            "type" => "string",
                            "def"  => "krbPrincipalName",
                            "desc" => _("The LDAP attribute that contains the user's Kerberos User Principal Name (UPN).")
                        },
                        "ldap_user_ssh_public_key" => {
                            "type" => "string",
                            "desc" => _("The LDAP attribute that contains the user's SSH public keys.")
                        },
                        "ldap_force_upper_case_realm" => {
                            "type" => "boolean",
                            "def"  => false,
                            "desc" => _("Some directory servers, for example Active Directory, might deliver the realm part of the UPN in lower case, which might cause the authentication to fail.") +
                                      _("Set this option to true if you want to use an upper-case realm.")
                        },
                        "ldap_enumeration_refresh_timeout" => {
                            "type" => "int",
                            "def"  => 300,
                            "desc" => _("Specifies how many seconds SSSD has to wait before refreshing its cache of enumerated records.")
                        },
                        "ldap_purge_cache_timeout" => {
                            "type" => "int",
                            "def"  => 10800,
                            "desc" => _("Determine how often to check the cache for inactive entries (such as groups with no members and users who have never logged in) and remove them to save space.")
                        },
                        "ldap_user_fullname" => {
                            "type" => "string",
                            "def"  => "cn",
                            "desc" => _("The LDAP attribute that corresponds to the user's full name.")
                        },
                        "ldap_user_member_of" => {
                            "type" => "string",
                            "def"  => "memeberOf",
                            "desc" => _("The LDAP attribute that lists the user's group memberships.")
                        },
                        "ldap_user_authorized_service" => {
                            "type" => "string",
                            "def"  => "authorizedService",
                            "desc" => _("If access_provider=ldap and ldap_access_order=authorized_service, SSSD will use the presence of the authorizedService attribute in the user's LDAP entry to determine access privilege.")
                        },
                        "ldap_user_authorized_host" => {
                            "type" => "string",
                            "def"  => "host",
                            "desc" => _("If access_provider=ldap and ldap_access_order=host, SSSD will use the presence of the host attribute in the user's LDAP entry to determine access privilege.")
                        },
                        "pwd_expiration_warning" => {
                            "type" => "int",
                            "def"  => 7,
                            "desc" => _("Display a warning N days before the password expires.")
                        },
                        "ldap_group_object_class" => {
                            "type" => "string",
                            "def"  => "posixGroup",
                            "desc" => _("The object class of a group entry in LDAP.")
                        },
                        "ldap_group_name" => {
                            "type" => "string",
                            "def"  => "cn",
                            "desc" => _("The LDAP attribute that corresponds to the group name.")
                        },
                        "ldap_group_gid_number" => {
                            "type" => "string",
                            "def"  => "gidNumber",
                            "desc" => _("The LDAP attribute that corresponds to the group's id.")
                        },
                        "ldap_group_member" => {
                            "type" => "string",
                            "def"  => "memberuid (rfc2307) / member (rfc2307bis)",
                            "desc" => _("The LDAP attribute that contains the names of the group's members.")
                        },
                        "ldap_group_uuid" => {
                            "type" => "string",
                            "def"  => "nsUniqueId",
                            "desc" => _("The LDAP attribute that contains the UUID/GUID of an LDAP group object.")
                        },
                        "ldap_group_objectsid" => {
                            "type" => "string",
                            "def"  => "objectSid for ActiveDirectory, not set for other servers.",
                            "desc" => _("The LDAP attribute that contains the objectSID of an LDAP group object.")
                        },
                        "ldap_group_modify_timestamp" => {
                            "type" => "string",
                            "def"  => "modifyTimestamp",
                            "desc" => _(" The LDAP attribute that contains timestamp of the last modification of the parent object.")
                        },
                        
                        "ldap_group_nesting_level" => {
                            "type" => "int",
                            "def"  => "2",
                            "desc" => _("If ldap_schema is set to a schema format that supports nested groups (e.g. RFC2307bis), then this option controls how many levels of nesting SSSD will follow.")
                        },
                   
                        "ldap_groups_use_matching_rule_in_chain" => {
                            "type" => "boolean",
                            "def"  => "False",
                            "desc" => _("This option tells SSSD to take advantage of an Active Directory-specific feature which may speed up group lookup operations on deployments with complex or deep nested groups.")
                        },
        
                        "ldap_initgroups_use_matching_rule_in_chain" => {
                            "type" => "boolean",
                            "def"  => "False",
                            "desc" => _("This option tells SSSD to take advantage of an Active Directory-specific feature which might speed up initgroups operations (most notably when dealing with complex or deep nested groups).")
                        },
                        
                        "ldap_netgroup_object_class" => {
                            "type" => "string",
                            "def"  => "nisNetgroup",
                            "desc" => _("           The object class of a netgroup entry in LDAP.")
                        },

                        "ldap_netgroup_name" => {
                            "type" => "string",
                            "def"  => "cn",
                            "desc" => _("The LDAP attribute that corresponds to the netgroup name.")
                        },
                        "ldap_netgroup_member" => {
                            "type" => "string",
                            "def"  => "memberNisNetgroup",
                            "desc" => _("The LDAP attribute that contains the names of the netgroup's members.")
                        },
                        "ldap_netgroup_triple" => {
                            "type" => "string",
                            "def"  => "nisNetgroupTriple",
                            "desc" => _("The LDAP attribute that contains the (host, user, domain) netgroup triples.")
                        },
                        "ldap_netgroup_uuid" => {
                            "type" => "string",
                            "def"  => "nsUniqueId",
                            "desc" => _("The LDAP attribute that contains the UUID/GUID of an LDAP netgroup object.")
                        },
                        "ldap_netgroup_modify_timestamp" => {
                            "type" => "string",
                            "def"  => "modifyTimestamp",
                            "desc" => _("The LDAP attribute that contains timestamp of the last modification of the parent object.")
                        },
                        "ldap_service_object_class" => {
                            "type" => "string",
                            "def"  => "ipService",
                            "desc" => _("The object class of a service entry in LDAP.")
                        },
                        "ldap_service_name" => {
                            "type" => "string",
                            "def"  => "cn",
                            "desc" => _("The LDAP attribute that contains the name of service attributes and their aliases.")
                        },
                        "ldap_service_port" => {
                            "type" => "string",
                            "def"  => "ipServicePort",
                            "desc" => _("The LDAP attribute that contains the port managed by this service.")
                        },
                        "ldap_service_proto" => {
                            "type" => "string",
                            "def"  => "ipServiceProtocol",
                            "desc" => _("The LDAP attribute that contains the protocols understood by this service.")
                        },
                        "ldap_service_search_base" => {
                            "type" => "string",
                            "def"  => "the value of ldap_search_base",
                            "desc" => _("An optional base DN, search scope and LDAP filter to restrict LDAP searches for this attribute type.")
                        },
                        "ldap_search_timeout" => {
                            "type" => "int",
                            "def"  => "6",
                            "desc" => _(" Specifies the timeout (in seconds) that ldap searches are allowed to run before they are cancelled and cached results are returned (and offline mode is entered).")
                        },
                        "ldap_enumeration_search_timeout" => {
                            "type" => "int",
                            "def"  => "60",
                            "desc" => _("Specifies the timeout (in seconds) that ldap searches for user and group enumerations are allowed to run before they are cancelled and cached results are returned (and offline mode is entered).")
                        },
                        "ldap_network_timeout" => {
                            "type" => "int",
                            "def"  => "6",
                            "desc" => _("Specifies the timeout (in seconds) after which the poll(2)/select(2) following a connect(2) returns in case of no activity.")
                        },
                        "ldap_opt_timeout" => {
                            "type" => "int",
                            "def"  => "6",
                            "desc" => _("Specifies a timeout (in seconds) after which calls to synchronous LDAP APIs will abort if no response is received.")
                        },
                        "ldap_connection_expire_timeout" => {
                            "type" => "int",
                            "def"  => "900 (15 minutes)",
                            "desc" => _("Specifies a timeout (in seconds) that a connection to an LDAP server will be maintained.")
                        },
                        "ldap_page_size" => {
                            "type" => "int",
                            "def"  => "1000",
                            "desc" => _("Specify the number of records to retrieve from LDAP in a single request. Some LDAP servers enforce a maximum limit per-request.")
                        },
                        "ldap_disable_paging" => {
                            "type" => "boolean",
                            "def"  => "False",
                            "desc" => _("Disable the LDAP paging control.")
                        },
                        "ldap_sasl_minssf" => {
                            "type" => "int",
                            "def"  => "system default",
                            "desc" => _("When communicating with an LDAP server using SASL, specify the minimum security level necessary to establish the connection.")
                        },
                        "ldap_deref_threshold" => {
                            "type" => "int",
                            "def"  => "10",
                            "desc" => _("Specify the number of group members that must be missing from the internal cache in order to trigger a dereference lookup.")
                        },
                        "ldap_tls_reqcert" => {
                            "type" => "string",
                            "def"  => "hard",
                            "desc" => _("Specifies what checks to perform on server certificates in a TLS session, if any.")
                        },
                        "ldap_tls_cacert" => {
                            "type" => "string",
                            "def"  => "OpenLDAP defaults",
                            "desc" => _("Specifies the file that contains certificates for all of the Certificate Authorities that sssd will recognize.")
                        },
                        "ldap_tls_cacertdir" => {
                            "type" => "string",
                            "def"  => "OpenLDAP defaults",
                            "desc" => _("Specifies the path of a directory that contains Certificate Authority certificates in separate individual files.")
                        },
                        "ldap_tls_cert" => {
                            "type" => "string",
                            "desc" => _("Specifies the file that contains the certificate for the client's key.")
                        },
                        "ldap_tls_key" => {
                            "type" => "string",
                            "desc" => _("Specifies the file that contains the client's key.")
                        },
                        "ldap_tls_cipher_suite" => {
                            "type" => "string",
                            "def"  => "OpenLDAP defaults",
                            "desc" => _("Specifies acceptable cipher suites.")
                        },
                        "ldap_id_use_start_tls" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Specifies that the id_provider connection must also use tls to protect the channel.")
                        },
                        "ldap_id_mapping" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Specifies that SSSD should attempt to map user and group IDs from the ldap_user_objectsid and ldap_group_objectsid attributes instead of relying on ldap_user_uid_number and ldap_group_gid_number.")
                        },
                        "ldap_sasl_mech" => {
                            "type" => "string",
                            "desc" => _("Specify the SASL mechanism to use.")
                        },
                        "ldap_sasl_authid" => {
                            "type" => "string",
                            "def"  => "host/hostname@REALM",
                            "desc" => _("Specify the SASL authorization id to use.")
                        },
                        "ldap_sasl_realm" => {
                            "type" => "string",
                            "def"  => "value of krb5_realm.",
                            "desc" => _("Specify the SASL realm to use.")
                        },
                        "ldap_sasl_canonicalize" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("If set to true, the LDAP library would perform a reverse lookup to canonicalize the host name during a SASL bind.")
                        },
                        "ldap_krb5_keytab" => {
                            "type" => "string",
                            "def"  => "System keytab",
                            "desc" => _("Specify the keytab to use when using SASL/GSSAPI.")
                        },
                        "ldap_krb5_init_creds" => {
                            "type" => "boolean",
                            "def"  => "true",
                            "desc" => _("Specifies that the id_provider should init Kerberos credentials (TGT).")
                        },
                        "ldap_krb5_ticket_lifetime" => {
                            "type" => "int",
                            "def"  => "86400 (24 hours)",
                            "desc" => _("Specifies the lifetime in seconds of the TGT if GSSAPI is used.")
                        },
                        "ldap_pwd_policy" => {
                            "type" => "string",
                            "vals"  => "none,shadow,mit_kerberos",                
                            "desc" => _("Select the policy to evaluate the password expiration on the client side.")
                        },
                        "ldap_referrals" => {
                            "type" => "boolean",
                            "def"  => "true",
                            "desc" => _("Specifies whether automatic referral chasing should be enabled.")
                        },
                        "ldap_dns_service_name" => {
                            "type" => "string",
                            "def"  => "ldap",
                            "desc" => _("Specifies the service name to use when service discovery is enabled.")
                        },
                        "ldap_chpass_dns_service_name" => {
                            "type" => "string",
                            "desc" => _("Specifies the service name to use to find an LDAP server which allows password changes when service discovery is enabled.")
                        },
                        "ldap_chpass_update_last_change" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Specifies whether to update the ldap_user_shadow_last_change attribute with days since the Epoch after a password change operation.")
                        },
                        "ldap_access_filter" => {
                            "type" => "string",
                            "def"  => "",
                            "desc" => _("If using access_provider = ldap and ldap_access_order = filter (default), this option is mandatory. It specifies an LDAP search filter criteria that must be met for the user to be granted access on this host.")
                        },
                        "ldap_account_expire_policy" => {
                            "type" => "string",
                            "vals"  => "shadow, ad, rhds, ipa, 389ds,nds",
                            "desc" => _(" With this option a client side evaluation of access control attributes can be enabled.")
                        },
                        "ldap_access_order" => {
                            "type" => "string",
                            "vals" => "filter, expire, authorized_service, host",
                            "def"  => "filter",
                            "desc" => _("Comma separated list of access control options.")
                        },
                        "ldap_deref" => {
                            "type" => "string",
                            "vals"  => "never, searching, finding, always",
                            "desc" => _("Specifies how alias dereferencing is done when performing a search.")
                        },
                        "ldap_rfc2307_fallback_to_local_users" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Allows to retain local users as members of an LDAP group for servers that use the RFC2307 schema.")
                        },
                        "" => {
                            "type" => "string",
                            "def"  => "",
                            "desc" => _("")
                        },
#                        "" => {
#                            "type" => "string",
#                            "def"  => "",
#                            "desc" => _("")
#                        },
                        },
                   #The kerberos domain section
                   "krb5" => {
                        "pwd_expiration_warning" => {
                            "type" => "int",
                            "def"  => 0,
                            "desc" => _("Display a warning N days before the password expires.")
                        },
                        "krb5_server" => {
                            "type" => "string",
                            "req"  => 1,
                            "desc" => _("Specifies the comma-separated list of IP addresses or hostnames of the Kerberos servers to which SSSD should connect, in the order of preference.")
                        },
                        "krb5_backup_server" => {
                            "type" => "string",
                            "desc" => _("Specifies the comma-separated list of IP addresses or hostnames of the Kerberos servers to which SSSD should connect, in the order of preference."),
                        },
                        "krb5_realm" => {
                            "type" => "string",
                            "req"  => 1,
                            "desc" => _("The name of the Kerberos realm.")
                        },
                        "krb5_kpasswd" => {
                            "type" => "string",
                            "def"  => "Use the KDC",
                            "desc" => _("If the change password service is not running on the KDC, alternative servers can be defined here.")
                        },
                        "krb5_backup_kpasswd" => {
                            "type" => "string",
                            "def"  => "Use the KDC",
                            "desc" => _("If the change password service is not running on the KDC, alternative servers can be defined here.")
                        },
                        "krb5_ccachedir" => {
                            "type" => "string",
                            "def"  => "/tmp",
                            "desc" => _("Directory to store credential caches")
                        },        
                        "krb5_ccname_template" => {
                            "type" => "string",
                            "def"  => "FILE:%d/krb5cc_%U_XXXXXX",
                            "desc" => _("Location of the user's credential cache.")
                        },
                        "krb5_auth_timeout" => {
                            "type" => "int",
                            "def"  => 15,
                            "desc" => _(" Timeout in seconds after an online authentication request or change password request is aborted.")
                        },
                        "krb5_validate" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Verify with the help of krb5_keytab that the TGT obtained has not been spoofed.")
                        },
                        "krb5_keytab" => {
                            "type" => "string",
                            "def"  => "/etc/krb5.keytab",
                            "desc" => _("The location of the keytab to use when validating credentials obtained from KDCs.")
                        },
                        "krb5_store_password_if_offline" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Store the password of the user if the provider is offline and use it to request a TGT when the provider comes online again.")
                        },
                        "krb5_renewable_lifetime" => {
                            "type" => "string",
                            "desc" => _("Request a renewable ticket with a total lifetime, given as an integer immediately followed by a time unit.")
                        },
                        "krb5_lifetime" => {
                            "type" => "string",
                            "desc" => _("Request ticket with a with a lifetime, given as an integer immediately followed by a time unit")
                        },
                        "krb5_renew_interval" => {
                            "type" => "int",
                            "desc" => _("The time in seconds between two checks if the TGT should be renewed.")
                        },
                        "krb5_use_fast" => {
                            "type" => "string",
                            "vals" => "never, try, demand",
                            "desc" => _("Enables flexible authentication secure tunneling (FAST) for Kerberos pre-authentication.")
                        },
                        "krb5_fast_principal" => {
                            "type" => "string",
                            "desc" => _("Specifies the server principal to use for FAST.")
                        },
                        "krb5_canonicalize" => {
                            "type" => "boolean",
                            "def"  => "false",
                            "desc" => _("Specifies if the host and user principal should be canonicalized.")
                        },
#                        "" => {
#                            "type" => "string",
#                            "def"  => "",
#                            "desc" => _("")
#                        },
                  },
                #The Active Directory domain section
                "ad" => {
                          
                        "ad_domain" => {
                            "type" => "string",
                            "desc" => _("Specifies the name of the Active Directory domain.")
                        },
                        "ad_server" => {
                            "type" => "string",
                            "desc" => _("The comma-separated list of IP addresses or hostnames of the AD servers to which SSSD should connect in order of preference.")
                        },
                        "ad_backup_server" => {
                            "type" => "string",
                            "desc" => _("The comma-separated list of IP addresses or hostnames of the AD servers to which SSSD should connect in order of preference.")
                        },
                        "ad_hostname" => {
                            "type" => "string",
                            "desc" => _("Optional. May be set on machines where the hostname(5) does not reflect the fully qualified name used in the Active Directory domain to identify this host.")
                        },
                        "override_homedir" => {
                            "type" => "string",
                            "desc" => _("Override the user's home directory.")
                        },
                        "fallback_homedir" => {
                            "type" => "string",
                            "desc" => _("Set a default template for a user's home directory if one is not specified explicitly by the domain's data provider.")
                        },
                        "default_shell" => {
                            "type" => "string",
                            "desc" => _("The default shell to use if the provider does not return one during lookup.")
                        },
                        "ldap_idmap_range_min" => {
                            "type" => "int",
                            "def"  => "200000",
                            "desc" => _(" Specifies the lower bound of the range of POSIX IDs to use for mapping Active Directory user and group SIDs.")
                        },
                        "ldap_idmap_range_max" => {
                            "type" => "int",
                            "def"  => "2000200000",
                            "desc" => _("Specifies the upper bound of the range of POSIX IDs to use for mapping Active Directory user and group SIDs.")
                        },
                        "ldap_idmap_range_size" => {
                            "type" => "int",
                            "def"  => "200000",
                            "desc" => _("Specifies the number of IDs available for each slice.")
                        },
                        "ldap_idmap_default_domain_sid" => {
                            "type" => "string",
                            "desc" => _("Specify the domain SID of the default domain.")
                        },
                        "ldap_idmap_default_domain" => {
                            "type" => "string",
                            "desc" => _("Specify the name of the default domain.")
                        },
                        "ldap_idmap_autorid_compat" => {
                            "type" => "boolean",
                            "def"  => "False",
                            "desc" => _("Changes the behavior of the ID-mapping algorithm to behave more similarly to winbind's “idmap_autorid” algorithm.")
                        }
#                        "" => {
#                            "type" => "string",
#                            "def"  => "",
#                            "desc" => _("")
#                        }
                  },

        }
    end
  end
end

