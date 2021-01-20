*** Variables ***
${n11_URL}  https://www.n11.com/
@{chrome_arguments}    --disable-infobars    --disable-gpu    enable-automation    --no-sandbox    --disable-extensions    --dns-prefetch-disable
${closePopupButton}     xpath=(//*[@class="closeBtn"])[1]
${laterButton}          xpath=(//*[text()='Daha Sonra'])[1]