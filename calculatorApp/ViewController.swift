//
//  ViewController.swift
//  calculatorApp
//
//  Created by Bibisara Kenesova on 08.01.2023.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    //MARK: - View with Label
    
    private lazy var intoView: UIView = {
        let view = UIView()
        view.addSubview(baseLabel)
        //view.backgroundColor = .green
        baseLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
        }
        return view
    }()
    
    private var baseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 75)
        label.textColor = .white
        label.text = "0"
        //label.backgroundColor = .yellow
        label.textAlignment = .right
        return label
    }()
    
    //MARK: - Buttons
    
    private func createButton(labelOfButton: String, color: UIColor, titleColor: UIColor) -> UIButton {
        let someButton = UIButton(type: .system)

        let widthConstraint = someButton.widthAnchor.constraint(equalToConstant: 30.0)
        let heightConstraint = someButton.heightAnchor.constraint(equalToConstant: 30.0)

        NSLayoutConstraint.activate([widthConstraint, heightConstraint])

        widthConstraint.constant =  80
        heightConstraint.constant = 80


        someButton.setTitle(labelOfButton, for: .normal)
        someButton.setTitleColor(titleColor, for: .normal)
        someButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        someButton.layer.cornerRadius = 0.5 * widthConstraint.constant
        someButton.clipsToBounds = true
        someButton.backgroundColor = color
        return someButton
    }
    
    //gray buttons
    
    private lazy var ACButton = createButton(labelOfButton: "AC", color: .systemGray2, titleColor: .black)
    private lazy var SignButton = createButton(labelOfButton: "+/-", color: .systemGray2, titleColor: .black)
    private lazy var PercentButton = createButton(labelOfButton: "%", color: .systemGray2, titleColor: .black)
    
    //orange signs
    
    private lazy var divisionButton = createButton(labelOfButton: "/", color: .orange, titleColor: .white)
    private lazy var multiplButton = createButton(labelOfButton: "x", color: .orange, titleColor: .white)
    private lazy var plusButton = createButton(labelOfButton: "+", color: .orange, titleColor: .white)
    private lazy var minusButton = createButton(labelOfButton: "-", color: .orange, titleColor: .white)
    private lazy var equalButton = createButton(labelOfButton: "=", color: .orange, titleColor: .white)
    
    //black point and numbers
    
    private lazy var zeroButton: UIButton = {
        let someButton = UIButton()

        let widthConstraint = someButton.widthAnchor.constraint(equalToConstant: 30.0)
        let heightConstraint = someButton.heightAnchor.constraint(equalToConstant: 30.0)

        NSLayoutConstraint.activate([widthConstraint, heightConstraint])

        widthConstraint.constant = 160
        heightConstraint.constant = 80


        someButton.setTitle("0", for: .normal)
        someButton.setTitleColor(.white, for: .normal)
        someButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        someButton.layer.cornerRadius = 35
        someButton.backgroundColor = .darkGray
        return someButton
    }()
    
    private lazy var pointButton = createButton(labelOfButton: ".", color: .darkGray, titleColor: .white)
    private lazy var oneButton = createButton(labelOfButton: "1", color: .darkGray, titleColor: .white)
    private lazy var twoButton = createButton(labelOfButton: "2", color: .darkGray, titleColor: .white)
    private lazy var threeButton = createButton(labelOfButton: "3", color: .darkGray, titleColor: .white)
    private lazy var fourButton = createButton(labelOfButton: "4", color: .darkGray, titleColor: .white)
    private lazy var fiveButton = createButton(labelOfButton: "5", color: .darkGray, titleColor: .white)
    private lazy var sixButton = createButton(labelOfButton: "6", color: .darkGray, titleColor: .white)
    private lazy var sevenButton = createButton(labelOfButton: "7", color: .darkGray, titleColor: .white)
    private lazy var eightButton = createButton(labelOfButton: "8", color: .darkGray, titleColor: .white)
    private lazy var nineButton = createButton(labelOfButton: "9", color: .darkGray, titleColor: .white)
    
    //MARK: - StackView
    private lazy var firstLineStackView: UIStackView = {
        let somestack = UIStackView()
        somestack.addArrangedSubview(ACButton)
        somestack.addArrangedSubview(SignButton)
        somestack.addArrangedSubview(PercentButton)
        somestack.addArrangedSubview(divisionButton)
        somestack.spacing = 5
        somestack.axis = .horizontal
//        somestack.alignment = .center
//        somestack.backgroundColor = .yellow
        return somestack
    }()
    
    private lazy var secondLineStackView: UIStackView = {
        let somestack = UIStackView()
        somestack.addArrangedSubview(sevenButton)
        somestack.addArrangedSubview(eightButton)
        somestack.addArrangedSubview(nineButton)
        somestack.addArrangedSubview(multiplButton)
        somestack.spacing = 5
        somestack.axis = .horizontal
//        somestack.alignment = .center
//        somestack.backgroundColor = .blue
        return somestack
    }()
    
    private lazy var thirdLineStackView: UIStackView = {
        let somestack = UIStackView()
        somestack.addArrangedSubview(fourButton)
        somestack.addArrangedSubview(fiveButton)
        somestack.addArrangedSubview(sixButton)
        somestack.addArrangedSubview(minusButton)
        somestack.spacing = 5
        somestack.axis = .horizontal
//        somestack.alignment = .center
//        somestack.backgroundColor = .orange
        return somestack
    }()
    
    private lazy var forthLineStackView: UIStackView = {
        let somestack = UIStackView()
        somestack.addArrangedSubview(oneButton)
        somestack.addArrangedSubview(twoButton)
        somestack.addArrangedSubview(threeButton)
        somestack.addArrangedSubview(plusButton)
        somestack.spacing = 5
        somestack.axis = .horizontal
//        somestack.alignment = .center
//        somestack.backgroundColor = .red
        return somestack
    }()
    
    private lazy var fifthLineStackView: UIStackView = {
        let somestack = UIStackView()
        somestack.addArrangedSubview(zeroButton)
        somestack.addArrangedSubview(pointButton)
        somestack.addArrangedSubview(equalButton)
        somestack.spacing = 5
        somestack.axis = .horizontal
        //somestack.alignment = .center
        //somestack.backgroundColor = .white
        return somestack
    }()
    
    private lazy var basicStackView: UIStackView = {
        let somestack = UIStackView()
        somestack.addArrangedSubview(firstLineStackView)
        somestack.addArrangedSubview(secondLineStackView)
        somestack.addArrangedSubview(thirdLineStackView)
        somestack.addArrangedSubview(forthLineStackView)
        somestack.addArrangedSubview(fifthLineStackView)
        somestack.axis = .vertical
        firstLineStackView.snp.makeConstraints { make in
            make.bottom.equalTo(secondLineStackView.snp.top).offset(-5)
        }
        secondLineStackView.snp.makeConstraints { make in
            make.bottom.equalTo(thirdLineStackView.snp.top).offset(-5)
        }
        thirdLineStackView.snp.makeConstraints { make in
            make.bottom.equalTo(forthLineStackView.snp.top).offset(-5)
        }
        forthLineStackView.snp.makeConstraints { make in
            make.bottom.equalTo(fifthLineStackView.snp.top).offset(-5)
        }
        fifthLineStackView.snp.makeConstraints { make in
            make.bottom.equalTo(somestack.snp.bottom).offset(-5)
        }
        somestack.spacing = 5
        return somestack
    }()
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        
        setupViews()
        setupConstrains()
    }


}

//MARK: - Setup views and constrains methods
private extension ViewController {
    func setupViews() {
        view.addSubview(intoView)
        view.addSubview(basicStackView)
    }
    
    func setupConstrains() {
        intoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.bottom.equalTo(basicStackView.snp.top).inset(-10)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        
        basicStackView.snp.makeConstraints { make in
            make.top.equalTo(intoView.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
            //make.height.equalToSuperview().multipliedBy(0.8)
            //make.centerY.equalToSuperview()
            //make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}
