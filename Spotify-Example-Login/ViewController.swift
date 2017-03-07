import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //var counter = -1
    //var timer = Timer()
    
    
    
    var isTimerEnable = false
    var startCounterBanner: Timer?
    
    
    
    
    var totalPages = 6
    
    let titleHome = ["Olá","Navegar","Buscar","Suas músicas","Rádio",""]
    
    let messagesHome = [
        "Inscreva-se para ouvir grátis no celular, no tablet e no computador ",
        "Explore as músicas mais tocadas, novos lançamentos ou a playlist certa para cada momento",
        "Procurando por aquele álbum ou artista especial? \n Basta buscar e apertar o Play!",
        "Salve qualquer música, álbum ou artista em sua própria coleção de músicas",
        "Relaxe e divirta-se com a Rádio do Spotify.Músicas ilimitadas baseadas no seu gosto musical.",
        ""]
    
    var backgroundPlayer : BackgroundVideo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        configureScrollView()
        configurePageControl()
        
        backgroundPlayer = BackgroundVideo(on: self, withVideoURL: "moments.mp4")
        backgroundPlayer?.setUpBackground()
        
        if !isTimerEnable {
            
            isTimerEnable = !isTimerEnable
            startCounterBanner = Timer.scheduledTimer( timeInterval: 5, target: self, selector: #selector(configureScrollView), userInfo: nil, repeats: true)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        backgroundPlayer?.pause()
    }
    
    
    func configureScrollView(){
        
        let subViews = self.scrollView.subviews
        for subview in subViews{
            subview.removeFromSuperview()
        }

        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(totalPages), height: scrollView.frame.size.height)
        
        scrollView.delegate = self
        
        for i in 0..<totalPages {
            
            let testView = Bundle.main.loadNibNamed("LoginTextView", owner: self, options: nil)?[0] as! UIView
            
            testView.frame = CGRect(x: CGFloat(i) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            
            let titleLabel = testView.viewWithTag(1) as! UILabel
            let textLabel = testView.viewWithTag(2) as! UILabel
            titleLabel.text = titleHome[i]
            textLabel.text = messagesHome[i]
            
            titleLabel.text = titleHome[Int(pageControl.currentPage)]
            textLabel.text = messagesHome[Int(pageControl.currentPage)]
            
            scrollView.addSubview(testView)
            
        }
        
                //counter += 1
        
                if pageControl.currentPage == 0 {
        
                    pageControl.currentPage = Int(1.0)
                }
                else if pageControl.currentPage == 1 {
        
                    pageControl.currentPage = Int(2.0)
        
                }
                else if pageControl.currentPage == 2 {
        
                    pageControl.currentPage = Int(3.0)
        
                }
                else if pageControl.currentPage == 3 {
        
                    pageControl.currentPage = Int(4.0)
        
                }
                else if pageControl.currentPage == 4 {
        
                    pageControl.currentPage = Int(5.0)
                }
                else {
        
                    pageControl.currentPage = Int(0.0)
        
        
                }
        
    }
    
    func configurePageControl(){
        
        pageControl.numberOfPages = totalPages
        pageControl.currentPage = 0
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentPage = floor(scrollView.contentOffset.x / UIScreen.main.bounds.size.width);
        
        pageControl.currentPage = Int(currentPage + 1)
        
    }
    
    @IBAction func changePage(_ sender: AnyObject) {
        
        var newFrame = scrollView.frame
        newFrame.origin.x = newFrame.size.width * CGFloat(pageControl.currentPage)
        scrollView.scrollRectToVisible(newFrame, animated: true)
        
    }
    
 
    
}
