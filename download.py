import xml.etree.ElementTree as ET
import requests
import datetime

DEV_TOKEN = 'TOKEN'

API_LOGIN_URL = 'https://pastebin.com/api/api_login.php'
API_LIST_PASTES_URL = 'https://pastebin.com/api/api_post.php'
API_GET_RAW_PASTE_URL = 'https://pastebin.com/api/api_raw.php'

print('')
print('')
print("'########:::::'###:::::'######::'########:'########:'########::'####:'##::: ##:")
print(" ##.... ##:::'## ##:::'##... ##:... ##..:: ##.....:: ##.... ##:. ##:: ###:: ##:")
print(" ##:::: ##::'##:. ##:: ##:::..::::: ##:::: ##::::::: ##:::: ##:: ##:: ####: ##:")
print(" ########::'##:::. ##:. ######::::: ##:::: ######::: ########::: ##:: ## ## ##:")
print(" ##.....::: #########::..... ##:::: ##:::: ##...:::: ##.... ##:: ##:: ##. ####:")
print(" ##:::::::: ##.... ##:'##::: ##:::: ##:::: ##::::::: ##:::: ##:: ##:: ##:. ###:")
print(" ##:::::::: ##:::: ##:. ######::::: ##:::: ########: ########::'####: ##::. ##:")
print("..:::::::::..:::::..:::......::::::..:::::........::........:::....::..::::..::")
print('')
print('')
print('Enter the credentials:')
print('Login: ')
USR_NAME = input()
print('Pwd:')
USR_PWD = input()
print('')
data = {'api_dev_key': DEV_TOKEN, 'api_user_name': USR_NAME, 'api_user_password': USR_PWD}

print('Getting personal token...')
request = requests.post(API_LOGIN_URL, data)
if request.text.startswith('Bad'):
    print('Something went wrong! Error')
    print(request.text)
    exit(1)

PERSONAL_TOKEN = request.text
print('✅✅✅✅✅Token obtained.')
print('')
print('Getting pastes for %s' % USR_NAME)
print('')

data = {'api_dev_key': DEV_TOKEN, 'api_user_key': PERSONAL_TOKEN, 'api_option': 'list'}
request = requests.post(API_LIST_PASTES_URL, data)
if request.text.startswith('Bad'):
    print('Something went wrong! Error')
    print(request.text)
    exit(1)

pastesTree = ET.fromstring('<root>' + request.text + '</root>')

for paste in pastesTree.iter('paste'):
    paste_title = paste.find('paste_title').text
    paste_date = paste.find('paste_date').text
    paste_key = paste.find('paste_key').text
    print('Downloading paste %s' % paste_title)

    data = {'api_dev_key': DEV_TOKEN, 'api_user_key': PERSONAL_TOKEN, 'api_paste_key': paste_key,
            'api_option': 'show_paste'}

    request = requests.post(API_GET_RAW_PASTE_URL, data)
    paste_content = request.text.encode('latin-1').decode('utf8', 'ignore')

    filename = paste_title.replace(' ', '_') + '.lua'

    file = open(filename, 'w+')
    file.write('-- File created by Tavisco/Oct125\n')
    file.write('-- On epoch: %s' % paste_date + '\n')
    date_time = datetime.datetime.fromtimestamp(int(paste_date))
    exct_time = date_time.strftime('%d %B %Y')
    file.write('-- On date: %s' % exct_time + '\n')
    file.write('\n')
    file.writelines(paste_content)
    file.close()
