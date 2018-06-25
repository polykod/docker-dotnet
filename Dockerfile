FROM fedora:28

#Revert from 2.1.301 to 2.1.201
#Setup make dotnet core 2.1.201 runtime

ENV DOTNET_SDK_VERSION 2.1.201
ENV ASPNETCORE_PKG_VERSION 2.0.8
ENV IMAGE_DATE 2018-06-25
ENV IMAGE_NUM 003

RUN export DOTNET_CLI_TELEMETRY_OPTOUT=1 \
    && dnf update -y \
    && dnf install -y https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm \
    && dnf install dotnet-sdk-2.1.201 wget libunwind nano mc compat-openssl10 icu iputils mc nano vim wget xz -y \
    && dnf clean all \
    && mkdir warmup \
    && cd warmup \
    && dotnet new \
    && cd .. \
    && rm -rf warmup \
    && rm -rf /tmp/NuGetScratch

