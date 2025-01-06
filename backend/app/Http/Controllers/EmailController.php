<?php

namespace App\Http\Controllers;

use App\Mail\BewhyMailable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class EmailController extends Controller
{
    //
    public function templateFooterEmail(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'fe_name' => 'required|string|max:255',
            'fe_email' => 'required|email|max:255',
            'fe_subject' => 'nullable|string|max:35',
            'fe_message' => 'required|string|min:20',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->with('error', 'Erro na valição de formulário')
                ->withErrors($validator)
                ->withInput();
        }

        try {
            $validatedData = $validator->validated();

            if (!$validatedData['fe_subject']) {
                $validatedData['fe_subject'] = 'Default Assunto';
            }

            $details = [
                'title' => $validatedData['fe_subject'],
                'body' => $validatedData['fe_name'].',<br /><br />'.$validatedData['fe_message'],
                'url' => 'https://api.bewhy.org',
            ];
            $mail = new BewhyMailable($details);
            $mail->replyTo($validatedData['fe_email']);
            Mail::to(config('mail.username'))->send($mail);

            return redirect()->back()
                ->with('success', 'Mensagem Enviada!');
        } catch (Exception $exception) {
            return redirect()->back()
                ->with('error', 'Algo aconteceu, último dado:')
                ->with('exception', $exception->getMessage());
        }
    }
}
