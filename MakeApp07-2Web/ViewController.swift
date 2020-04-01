import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivitylndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://www.google.com")
    }
    
    func webView0(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivitylndicator.startAnimating()
        myActivitylndicator.isHidden=false
    }
    
    func webView1(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivitylndicator.stopAnimating()
        myActivitylndicator.isHidden = true
    }
    
    func webView2(_ webView: WKWebView, didFail navigation: WKNavigation!) {
        myActivitylndicator.stopAnimating()
        myActivitylndicator.isHidden = true
    }

    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag { //because hasPrefix Returns a Boolean value
            strUrl = "http://" + strUrl
    }
        return strUrl
}
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://dic.daum.net/index.do?dic=eng&q=")
    }
    @IBAction func btnGosite2(_ sender: UIButton) {
        loadWebPage("http://www.apple.com/kr/")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹페이지 </p> <p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

