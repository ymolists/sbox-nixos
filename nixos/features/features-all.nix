
{ config, lib, inputs, ... }:

{
  options = {


    docean-disko.enable = 
      lib.mkEnableOption "docean disko module";

    docean-hware.enable = 
      lib.mkEnableOption "docean hardware module";

    services-network.enable = 
      lib.mkEnableOption "";

    services-openssh-service.enable = 
      lib.mkEnableOption "";

    system-base.enable = 
      lib.mkEnableOption "Common configuration for all hosts";

    users-tester.enable = 
      lib.mkEnableOption "";};


}