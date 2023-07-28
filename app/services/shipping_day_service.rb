class ShippingDayService
  def self.options
    [
      { id: 1, shipping_day: '---' },
      { id: 2, shipping_day: '1\~2日で発送' },
      { id: 3, shipping_day: '2\~3日で発送' },
      { id: 4, shipping_day: '4\~7日で発送' },
    ]
  end
end