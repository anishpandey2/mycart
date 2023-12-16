<!-- Modal -->
<div  style="max-width: 450px;margin:auto;" class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="font-size: 15px;">
            <div class="modal-header custom-bg">
                <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="cart-body">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-sm btn-primary checkout-btn" onclick="goToCheckout()">Checkout</button>
            </div>
        </div>
    </div>
</div>


<!--toast-->
<div  id="toast">This is our custom Toast text</div>

