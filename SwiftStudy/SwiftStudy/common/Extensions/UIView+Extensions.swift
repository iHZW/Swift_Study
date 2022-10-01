import UIKit
import Foundation

// MARK: - Designable Extension

@IBDesignable
extension UIView {
    
    @IBInspectable
    /// Should the corner be as circle
    public var circleCorner: Bool {
        get {
            return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
        }
        set {
            cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
                //abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable
    /// Border color of view; also inspectable from Storyboard.
    public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable
    /// Border width of view; also inspectable from Storyboard.
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    /// Shadow color of view; also inspectable from Storyboard.
    public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    /// Shadow offset of view; also inspectable from Storyboard.
    public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    /// Shadow opacity of view; also inspectable from Storyboard.
    public var shadowOpacity: Double {
        get {
            return Double(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable
    /// Shadow radius of view; also inspectable from Storyboard.
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    /// Shadow path of view; also inspectable from Storyboard.
    public var shadowPath: CGPath? {
        get {
            return layer.shadowPath
        }
        set {
            layer.shadowPath = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowShouldRasterize: Bool {
        get {
            return layer.shouldRasterize
        }
        set {
            layer.shouldRasterize = newValue
        }
    }
    
    @IBInspectable
    /// Should shadow rasterize of view; also inspectable from Storyboard.
    /// cache the rendered shadow so that it doesn't need to be redrawn
    public var shadowRasterizationScale: CGFloat {
        get {
            return layer.rasterizationScale
        }
        set {
            layer.rasterizationScale = newValue
        }
    }
    
    @IBInspectable
    /// Corner radius of view; also inspectable from Storyboard.
    public var maskToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
}


// MARK: - Properties

public extension UIView {
    
    // MARK: 3.1、x 的位置
    /// x 的位置
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.origin.x = newValue
            self.frame = tempFrame
        }
    }
    // MARK: 3.2、y 的位置
    /// y 的位置
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.origin.y = newValue
            self.frame = tempFrame
        }
    }
    
    // MARK: 3.3、height: 视图的高度
    /// height: 视图的高度
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.size.height = newValue
            self.frame = tempFrame
        }
    }
    // MARK: 3.4、width: 视图的宽度
    /// width: 视图的宽度
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.size.width = newValue
            self.frame = tempFrame
        }
    }
    // MARK: 3.5、size: 视图的zize
    /// size: 视图的zize
    var size: CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.size = newValue
            self.frame = tempFrame
        }
    }
    // MARK: 3.6、centerX: 视图的X中间位置
    /// centerX: 视图的X中间位置
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = self.center
            tempCenter.x = newValue
            self.center = tempCenter
        }
    }
    // MARK: 3.7、centerY: 视图的Y中间位置
    /// centerY: 视图Y的中间位置
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = self.center
            tempCenter.y = newValue
            self.center = tempCenter;
        }
    }
    // MARK: 3.8、center: 视图的中间位置
    /// centerY: 视图Y的中间位置
//    var center: CGPoint {
//        get {
//            return self.center
//        }
//        set(newValue) {
//            var tempCenter: CGPoint = self.center
//            tempCenter = newValue
//            self.center = tempCenter;
//        }
//    }
    // MARK: 3.9、top 上端横坐标(y)
    /// top 上端横坐标(y)
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.origin.y = newValue
            self.frame = tempFrame
        }
    }
    // MARK: 3.10、left 左端横坐标(x)
    /// left 左端横坐标(x)
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = self.frame
            tempFrame.origin.x = newValue
            self.frame = tempFrame
        }
    }
    // MARK: 3.11、bottom 底端纵坐标 (y + height)
    /// bottom 底端纵坐标 (y + height)
    var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set(newValue) {
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    // MARK: 3.12、right 底端纵坐标 (x + width)
    /// right 底端纵坐标 (x + width)
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set(newValue) {
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
}

// MARK: - 五、关于UIView的 圆角、阴影、边框 的设置
public extension UIView {
    // MARK: 5.1、添加圆角
    /// 添加圆角
    /// - Parameters:
    ///   - conrners: 具体哪个圆角
    ///   - radius: 圆角的大小
    func addCorner(conrners: UIRectCorner , radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    // MARK: 5.2、给继承于view的类添加阴影
    /// 给继承于view的类添加阴影
    /// - Parameters:
    ///   - shadowColor: 阴影的颜色
    ///   - shadowOffset: 阴影的偏移度：CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
    ///   - shadowOpacity: 阴影的透明度
    ///   - shadowRadius: 阴影半径，默认 3
    func addShadow(shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat = 3) {
        // 设置阴影颜色
        layer.shadowColor = shadowColor.cgColor
        // 设置透明度
        layer.shadowOpacity = shadowOpacity
        // 设置阴影半径
        layer.shadowRadius = shadowRadius
        // 设置阴影偏移量
        layer.shadowOffset = shadowOffset
    }
    // MARK: 5.3、添加阴影和圆角并存
    /// 添加阴影和圆角并存
    /// - Parameters:
    ///   - conrners: 具体哪个圆角
    ///   - radius: 圆角大小
    ///   - shadowColor: 阴影的颜色
    ///   - shadowOffset: 阴影的偏移度：CGSizeMake(X[正的右偏移,负的左偏移], Y[正的下偏移,负的上偏移]);
    ///   - shadowOpacity: 阴影的透明度
    ///   - shadowRadius: 阴影半径，默认 3
    func addCornerAndShadow(superview: UIView, conrners: UIRectCorner , radius: CGFloat = 3, shadowColor: UIColor, shadowOffset: CGSize, shadowOpacity: Float, shadowRadius: CGFloat = 3) {
    
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    
        let subLayer = CALayer()
        let fixframe = self.frame
        subLayer.frame = fixframe
        subLayer.cornerRadius = shadowRadius
        subLayer.backgroundColor = shadowColor.cgColor
        subLayer.masksToBounds = false
        // shadowColor阴影颜色
        subLayer.shadowColor = shadowColor.cgColor
        // shadowOffset阴影偏移,x向右偏移3，y向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
        subLayer.shadowOffset = shadowOffset
        // 阴影透明度，默认0
        subLayer.shadowOpacity = shadowOpacity
        // 阴影半径，默认3
        subLayer.shadowRadius = shadowRadius
        superview.layer.insertSublayer(subLayer, below: self.layer)
    }
    // MARK: 5.4、添加边框
    /// 添加边框
    /// - Parameters:
    ///   - width: 边框宽度
    ///   - color: 边框颜色
    func addBorder(borderWidth: CGFloat, borderColor: UIColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
    // MARK: 5.5、添加顶部的 边框
    /// 添加顶部的 边框
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func addBorderTop(borderWidth: CGFloat, borderColor: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: borderWidth, color: borderColor)
    }
    // MARK: 5.6、添加顶部的 内边框
    /// 添加顶部的 内边框
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    ///   - padding: 边框距离边上的距离
    func addBorderTopWithPadding(borderWidth: CGFloat, borderColor: UIColor, padding: CGFloat) {
        addBorderUtility(x: padding, y: 0, width: frame.width - padding*2, height: borderWidth, color: borderColor)
    }
    // MARK: 5.7、添加底部的 边框
    /// 添加底部的 边框
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func addBorderBottom(borderWidth: CGFloat, borderColor: UIColor) {
        addBorderUtility(x: 0, y: frame.height - borderWidth, width: frame.width, height: borderWidth, color: borderColor)
    }
    // MARK: 5.8、添加左边的 边框
    /// 添加左边的 边框
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func addBorderLeft(borderWidth: CGFloat, borderColor: UIColor) {
        addBorderUtility(x: 0, y: 0, width: borderWidth, height: frame.height, color: borderColor)
    }
    // MARK: 5.9、添加右边的 边框
    /// 添加右边的 边框
    /// - Parameters:
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func addBorderRight(borderWidth: CGFloat, borderColor: UIColor) {
        addBorderUtility(x: frame.width - borderWidth, y: 0, width: borderWidth, height: frame.height, color: borderColor)
    }
    // MARK:- 5.10、画圆环
    /// 画圆环
    /// - Parameters:
    ///   - fillColor: 内环的颜色
    ///   - strokeColor: 外环的颜色
    ///   - strokeWidth: 外环的宽度
    func drawCircle(fillColor: UIColor, strokeColor: UIColor, strokeWidth: CGFloat) {
        let ciecleRadius = self.width > self.height ? self.height : self.width
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: ciecleRadius, height: ciecleRadius), cornerRadius: ciecleRadius / 2)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = strokeWidth
        self.layer.addSublayer(shapeLayer)
    }
    
    // 画线
    func addBorderUtility(x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat, color:UIColor) {
//        let line = UIView.init(frame: CGRect(x: x, y: y, width: width, height: height)).backgroundColor(color)
//        self.addSubview(line)
                
        let path = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: height))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}


// MARK: - Methods

public extension UIView {
    
    typealias Configuration = (UIView) -> Swift.Void
    
    func config(configurate: Configuration?) {
        configurate?(self)
    }
    
    /// Set some or all corners radiuses of view.
    ///
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: T.self) }
    }
}

extension UIView {
    
    func searchVisualEffectsSubview() -> UIVisualEffectView? {
        if let visualEffectView = self as? UIVisualEffectView {
            return visualEffectView
        } else {
            for subview in subviews {
                if let found = subview.searchVisualEffectsSubview() {
                    return found
                }
            }
        }
        return nil
    }
    
    /// This is the function to get subViews of a view of a particular type
    /// https://stackoverflow.com/a/45297466/5321670
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /// This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T
    /// https://stackoverflow.com/a/45297466/5321670
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}


// MARK: - 六、自定义链式编程
public extension UIView {
    // MARK: 6.1、设置 tag 值
    /// 设置 tag 值
    /// - Parameter tag: 值
    /// - Returns: 返回自身
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    // MARK: 6.2、设置圆角
    /// 设置圆角
    /// - Parameter cornerRadius: 圆角
    /// - Returns: 返回自身
    @discardableResult
    func corner(_ cornerRadius: CGFloat) -> Self {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        return self
    }
    // MARK: 6.3、图片的模式
    /// 图片的模式
    /// - Parameter mode: 模式
    /// - Returns: 返回图片的模式
    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }
    // MARK: 6.4、设置背景色
    /// 设置背景色
    /// - Parameter color: 颜色
    /// - Returns: 返回自身
    @discardableResult
    func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    // MARK: 6.5、设置十六进制颜色
    /// 设置十六进制颜色
    /// - Parameter hex: 十六进制颜色
    /// - Returns: 返回自身
    @discardableResult
    func backgroundColor(_ hex: String) -> Self {
        backgroundColor = UIColor(hexString: hex)
        return self
    }
    // MARK: 6.6、设置 frame
    /// 设置 frame
    /// - Parameter frame: frame
    /// - Returns: 返回自身
    @discardableResult
    func frame(_ frame: CGRect) -> Self {
       self.frame = frame
        return self
    }
    // MARK: 6.7、被添加到某个视图上
    /// 被添加到某个视图上
    /// - Parameter superView: 父视图
    /// - Returns: 返回自身
    @discardableResult
    func addTo(_ superView: UIView) -> Self {
        superView.addSubview(self)
        return self
    }
    // MARK: 6.8、设置是否支持触摸
    /// 设置是否支持触摸
    /// - Parameter isUserInteractionEnabled: 是否支持触摸
    /// - Returns: 返回自身
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    // MARK: 6.9、设置是否隐藏
    /// 设置是否隐藏
    /// - Parameter isHidden: 是否隐藏
    /// - Returns: 返回自身
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    // MARK: 6.10、设置透明度
    /// 设置透明度
    /// - Parameter alpha: 透明度
    /// - Returns: 返回自身
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    // MARK: 6.11、设置tintColor
    /// 设置tintColor
    /// - Parameter tintColor: tintColor description
    /// - Returns: 返回自身
    @discardableResult
    func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
}

// MARK: - 其他的方法
public extension UIView {
    // MARK: 获取当前view的viewcontroller
    /// 获取当前view的viewcontroller
    var currentVC: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    // MARK: 添加水印
    /// 添加水印
    /// - Parameters:
    ///   - markText: 水印文字
    ///   - textColor: 水印文字颜色
    ///   - font: 水印文字大小
    func addWater(markText: String, textColor: UIColor = UIColor.black, font: UIFont = UIFont.systemFont(ofSize: 12)) {
        let waterMark: NSString = markText.toNSString
        let textSize: CGSize = waterMark.size(withAttributes: [NSAttributedString.Key.font : font])
        // 多少行
        let line: NSInteger = NSInteger(self.height * 3.5 / 80)
        // 多少列：自己的宽度/(每个水印的宽度+间隔)
        let row: NSInteger = NSInteger(self.width / markText.rectWidth(font: font, size: CGSize(width: self.width, height: CGFloat(MAXFLOAT))))
        for i in 0..<line {
            for j in 0..<row {
                let textLayer: CATextLayer = CATextLayer()
                // textLayer.backgroundColor = UIColor.randomColor().cgColor
                //按当前屏幕分辨显示，否则会模糊
                textLayer.contentsScale = UIScreen.main.scale
                textLayer.font = font
                textLayer.fontSize = font.pointSize
                textLayer.foregroundColor = textColor.cgColor
                textLayer.string = waterMark
                textLayer.frame = CGRect(x: CGFloat(j) * (textSize.width + 30), y: CGFloat(i) * 60, width: textSize.width, height: textSize.height)
                // 旋转文字
                textLayer.transform = CATransform3DMakeRotation(CGFloat(Double.pi*0.2), 0, 0, 3)
                self.layer.addSublayer(textLayer)
            }
        }
    }
}
