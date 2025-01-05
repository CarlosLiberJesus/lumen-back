<?php

namespace App\Http\Controllers;

use App\Mail\BewhyMailable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    //
    public function templateFooterEmail(Request $request)
    {
        // Validate the incoming request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255', // Added unique validation
            'subject' => 'nullable|string|max:35',
            'message' => 'required|string|min:20',
        ]);

        // Add status_id to the validated data
        // duster-ignore not_operator_with_successor_space
        if (!$validatedData['subject']) {
            $validatedData['subject'] = 'Default Assunto';
        }

        try {
            $details = [
                'title' => $validatedData['subject'],
                'body' => $validatedData['message'],
                'url' => 'https://api.bewhy.org',
            ];

            $mail = new BewhyMailable($details);
            $mail->replyTo($validatedData['email']);
            Mail::to(config('mail.username'))->send($mail);

            return redirect()->back()
                ->with('success', 'Mensagem Enviada!');
        } catch (Exception $e) {
            // Handle the exception
            return redirect()->back()
                ->with('error', 'Algo aconteceu, último dado:')
                ->with('exception', $e->getMessage());
        }
    }
}
