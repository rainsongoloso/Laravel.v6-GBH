<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ManageOccupantsController extends Controller
{
    public function __construct()
    {
        $this->middleware(['isAdmin','isActive','auth']);
    }

    
}
