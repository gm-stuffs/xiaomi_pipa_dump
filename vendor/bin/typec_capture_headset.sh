# sample usage: playback_capture_headset.sh
VOCALTRACT=$1

echo "let screen on"
input keyevent 224

echo "enabling headset mic"
tinymix 'TX DEC0 MUX' 'SWR_MIC'
tinymix 'TX SMIC MUX0' 'ADC1'
tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'
tinymix 'TX_AIF1_CAP Mixer DEC0' 1
tinymix 'ADC2 Volume' 6
tinymix 'ADC2_MIXER Switch' 1
tinymix 'HDR12 MUX' 'NO_HDR12'
tinymix 'ADC2 MUX' 'INP2'
tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 1
tinymix 'TX_CDC_DMA_TX_3 SampleRate' 'KHZ_48'

# start recording
tinycap /data/data/test1_$VOCALTRACT.wav -r 48000 -b 16 -T 2 &

usleep 100000

echo "enabling headphone"
tinymix 'RX_MACRO RX0 MUX' 'AIF1_PB'
tinymix 'RX_MACRO RX1 MUX' 'AIF1_PB'
tinymix 'RX_CDC_DMA_RX_0 Channels' 'Two'
tinymix 'RX INT0_1 MIX1 INP0' 'RX0'
tinymix 'RX INT1_1 MIX1 INP0' 'RX1'
tinymix 'RX INT0 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'CLSH_DSM_OUT'
tinymix 'RX_HPH_PWR_MODE' 'LOHIFI'
tinymix 'RX HPH Mode' 'CLS_H_LOHIFI'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 1
tinymix 'HPHR_RDAC Switch' 1
tinymix 'RX_RX0 Digital Volume' 84
tinymix "RX_RX1 Digital Volume" 84
tinymix 'HPHL Volume' 20
tinymix 'HPHR Volume' 20
tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 1
tinyplay /vendor/etc/RES1K.wav

echo "disabling headphone"
tinymix 'RX_MACRO RX0 MUX' 'ZERO'
tinymix 'RX_MACRO RX1 MUX' 'ZERO'
tinymix 'RX_CDC_DMA_RX_0 Channels' 'One'
tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 0
tinymix 'HPHR_RDAC Switch' 0
tinymix 'RX_CDC_DMA_RX_0 Audio Mixer MultiMedia1' 0

usleep 1900000

echo "disabling headset mic"
tinymix 'TX DEC0 MUX' 'SWR_MIC'
tinymix 'TX SMIC MUX0' 'ZERO'
tinymix 'TX_CDC_DMA_TX_3 Channels' 'One'
tinymix 'TX_AIF1_CAP Mixer DEC0' 0
tinymix 'ADC2_MIXER Switch' 0
tinymix 'MultiMedia1 Mixer TX_CDC_DMA_TX_3' 0
