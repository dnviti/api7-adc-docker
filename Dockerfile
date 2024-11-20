FROM debian:stable-slim
ARG ADC_VERSION="0.16.1"
ARG ADC_OS="linux"
ARG ADC_ARC="amd64"

RUN apt-get update && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget "https://github.com/api7/adc/releases/download/v${ADC_VERSION}/adc_${ADC_VERSION}_${ADC_OS}_${ADC_ARC}.tar.gz"  && \
    tar -zxvf "adc_${ADC_VERSION}${ADC_OS}${ADC_ARC}.tar.gz"  && \
    mv ./adc /bin/adc && rm -rf adc_${ADC_VERSION}_${ADC_OS}_${ADC_ARC}.tar.gz

CMD /bin/adc
