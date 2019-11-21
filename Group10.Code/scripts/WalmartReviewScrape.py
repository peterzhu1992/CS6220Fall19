# Modified from Mahmuh Ahsan https://github.com/mahmudahsan

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import os
import time
import sys

def clean(filename):
    filename = filename.replace('<', ' ')
    filename = filename.replace('>', ' ')
    filename = filename.replace(':', ' ')
    filename = filename.replace('"', ' ')
    filename = filename.replace('/', ' ')
    filename = filename.replace('\\', ' ')
    filename = filename.replace('|', ' ')
    filename = filename.replace('?', ' ')
    filename = filename.replace('*', ' ')

    return filename

def getReviews(product):
    global counter
    product = clean(product)

    try:
        seeReviewsButton = driver.find_element_by_css_selector("button[class*='button ReviewsHeader-seeAll button--primary']")

        seeReviewsButton.click()

        WebDriverWait(driver, 10).until(EC.staleness_of(seeReviewsButton))
    except:
        return

    with open("{}/{}.json".format(folder, product), 'w', encoding="utf-8") as file:
        while True:
            try:
                WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, "div[class='review']" )))

                reviews = driver.find_elements_by_css_selector("div[class='review']")

                for review in reviews:
                    try:
                        starElement = review.find_element_by_css_selector("span[class='stars-container']")

                        starText = starElement.get_attribute("aria-label")

                        starText = starText[:3]

                        reviewBody = review.find_element_by_xpath("./div/div[contains(@class, 'review-body')]/div/div/div/div/div/p").text

                        reviewBody = reviewBody.replace('"', '\'')
                        reviewBody = reviewBody.replace('\\', '/')
                        #review = starText + " - '" + reviewBody + "'" + "\n"
                        asin = "w" + str(counter)
                        review = "{" + "\"asin\": \"{}\", \"reviewText\": \"{}\", \"overall\": {}".format(asin, reviewBody, starText) + "}\n"
                        file.write(review)
                    except Exception as e:
                        print(e)
                        print("error in collecting review")
                        continue

                WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, "button[class='paginator-btn paginator-btn-next']")))
                nextPage = driver.find_element_by_css_selector("button[class='paginator-btn paginator-btn-next']")
                nextPage.click()
                WebDriverWait(driver,10)

            except Exception as e:
                print(e.message())
                break


def visitProducts(number):
    global counter
    for i in range(0, number - 1):
        print(baseUrl)
        driver.get(baseUrl)

        counter += 1
        try:
            string = "ProductTileGridView-" + str(i)
            selector = "li[class ^= 'Grid-col'][data-tl-id = '{}']".format(string)

            WebDriverWait(driver,10).until(EC.presence_of_element_located((By.CSS_SELECTOR, selector)))

            product = driver.find_element_by_css_selector(selector)
            image = product.find_element_by_css_selector("img")
            image.click()
            WebDriverWait(driver, 10).until(EC.staleness_of(image))

            WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CSS_SELECTOR, "h1[class ^= 'prod-ProductTitle']")))
            title = driver.find_element_by_css_selector("h1[class ^= 'prod-ProductTitle']").get_attribute("content")

            getReviews(title)

        except Exception as e:
            print(e)

chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--window-size=1024x1400")

chrome_driver = os.path.join(os.getcwd(), "chromedriver")
driver = webdriver.Chrome(chrome_options=chrome_options, executable_path=chrome_driver)
driver.implicitly_wait(20) # will wait for 20 seconds anytime trying to find something it cannot

products = {
    "Video_Games": [
    #"https://www.walmart.com/browse/video-games/playstation-4-ps4-games/2636_1102672_1105671",
    #"https://www.walmart.com/browse/video-games/xbox-one-games/2636_1224908_1224996",
    #"https://www.walmart.com/browse/video-games/nintendo-switch-games/2636_4646529_4234943"
    "https://www.walmart.com/browse/nintendo-wii-u-wii/2636_1098124?cat_id=2636_1098124_1225001"

    ],
    "Sports_and_Outdoors": [
    #"https://www.walmart.com/browse/sports-outdoors/basketballs/4125_4161_4165_1075704",
    #"https://www.walmart.com/browse/sports-outdoors/footballs/4125_4161_434036_1075724",
    #"https://www.walmart.com/browse/sports-outdoors/baseballs/4125_4161_4162_1075685"

    ],
    "Office_Products": [
    #"https://www.walmart.com/browse/office-supplies/pens/1229749_1988510",
    #"https://www.walmart.com/browse/office-supplies/binders-accessories/1229749_5093993",
    #"https://www.walmart.com/browse/office-supplies/envelopes-mailing-supplies/1229749_9785239"

    ],
    "Movies_and_TV": [
    #"https://www.walmart.com/browse/movies-tv-shows/action-adventure-movies/4096_530598_530698",
    #"https://www.walmart.com/browse/movies-tv-shows/anime-animation-movies/4096_530598_530699",
    #"https://www.walmart.com/browse/movies-tv-shows/comedy-movies/4096_530598_530703"

    ],
    "Electronics": [
    #"https://www.walmart.com/browse/tv-video/all-tvs/3944_1060825_447913",
    #"https://www.walmart.com/browse/cell-phones/unlocked-phones/1105910_1073085",
    #"https://www.walmart.com/browse/electronics/all-laptop-computers/3944_3951_1089430_132960"

    ],
    "Beauty": [
    #"https://www.walmart.com/browse/beauty/best-sellers/1085666_7192911_7876574",
    #"https://www.walmart.com/browse/beauty/exclusives/1085666_7192911_5349205",
    #"https://www.walmart.com/browse/beauty-next-day/1085666_1470355"

    ],
    "Clothing_Shoes_and_Jewelry": [
    #"https://www.walmart.com/browse/women/womens-new-arrivals/5438_133162_5114784",
    #"https://www.walmart.com/browse/men/mens-new-arrivals/5438_133197_7401997",
    #"https://www.walmart.com/browse/kids-clothing/kids-new-arrivals/5438_7712430_4045705?povid=FashionGlobalNav_Kids_NewArrivals"
    "https://www.walmart.com/browse/jewelry/men-s-jewelry/3891_1321845_1966546?povid=FashionTopNav_JewelryWatches_Men",
    "https://www.walmart.com/search/?cat_id=5438_1045804_1045806_7783731_1228546&grid=true&query=womens+shoes"
    ]
}

counter = 150000

for product in products.keys():
    folder = product

    for url in products[product]:
        baseUrl = url
        visitProducts(100)

driver.quit()