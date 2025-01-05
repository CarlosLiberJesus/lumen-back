<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\NewsletterUser;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class NewsLetterUserController extends Controller
{
    //
    public function newsletter()
    {
        return view('web.newsletter.newsletter');
    }

    public function submitNewsletter(Request $request)
    {
        // Validate the incoming request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:newsletter_users,email', // Added unique validation
            'phone' => 'nullable|string|max:20',
        ]);

        // Add status_id to the validated data
        $validatedData['hash'] = Str::uuid();

        try {

            // Attempt to create the newsletter entry
            NewsletterUser::create($validatedData);

            return redirect()->back()->with('success', 'Obrigado pelo pré registo! Novidades virão.');
        } catch (Exception $e) {
            // Handle the exception
            return redirect()->back()
                ->with('error', 'Algo aconteceu, último dado:')
                ->with('exception', $e->getMessage());
        }
    }
}
