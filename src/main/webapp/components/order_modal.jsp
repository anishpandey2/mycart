
<!-- Modal -->
<div style="width: 300px;margin: auto;" class="modal fade" id="order" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Payment Options</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input value="checked" type="checkbox" checked> Only cash on delivery available

                </div>
                <div>
                    <p>Do you still want to continue?</p>
                </div>
            </div>
            <div class="modal-footer">
                <div class="container text-center">
                    
                    <button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal" onclick="showToast('Order placed successfully')">Yes</button>
                    <button type="button" class="btn btn-outline-danger btn-sm" onclick="goToHome()" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </div>
    </div>
</div>
